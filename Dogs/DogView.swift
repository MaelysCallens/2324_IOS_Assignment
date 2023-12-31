//
//  DogView.swift
//  Dogs
//
//  Created by Maëlys Callens on 30/12/2023.
//

import SwiftUI

struct DogView: View {
    
    @State var dogs = [Dog]()
    
    var body: some View {
        List(dogs) { dog in
            //NavigationLink(<#LocalizedStringKey#>, destination: DogDetailView(dog: dog))
                NavigationLink(value: dog.id) {
                    DogRow(dog: dog)
            }
        }.onAppear() {
            Api().loadData { (dogs) in
                self.dogs = dogs
            }
        }
        .navigationDestination(for: Dog.ID.self) { dogId in
            if let index = dogs.firstIndex(where: { $0.id == dogId }) {
                //DogDetailView(dog: dog[index])
            }
        }
        .navigationTitle("Dog List")
        //.navigationBarTitleDisplayMode(.inline) //zet de titel in het midden en veel kleiner
    }
}

struct DogRow: View {
    let dog: Dog
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: dog.url)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
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
            ForEach(dog.breeds, id: \.name) { breed in
                Text("\(breed.name)")
            }
        }
    }
}

#Preview {
    DogView()
}
