//
//  CatView.swift
//  Dogs
//
//  Created by Maëlys Callens on 31/12/2023.
//

import SwiftUI

struct CatView: View {
    
    @State var cats = [Cat]()
    
    var body: some View {
        
        List(cats) { cat in
            CatRow(cat: cat)
            
        }.onAppear() {
                CatApi().loadData { (cats) in
                    self.cats = cats
                }
            }
        }
    
}

struct CatRow: View {
    let cat: Cat
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: cat.url)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                case .failure:
                    Image(systemName: "photo") // Als foto niet aanwzig is in API, dan word er deze foto geplaatst
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                case .empty:
                    ProgressView() // Er wordt een laadindicator toegevoegd terwijl de afbeelding wordt geladen
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    CatView()
}
