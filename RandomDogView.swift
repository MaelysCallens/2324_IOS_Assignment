//
//  RandomDogView.swift
//  Dogs
//
//  Created by Maëlys Callens on 30/12/2023.
//

import SwiftUI

struct RandomDogView: View {
    
    //@State var randomDogs = [RandomDog]()
    
    @State var dogs = [Dog]()
    
    var body: some View {
        VStack {
            Text("Dog of the moment")
            
            if let dog = dogs.first {
                NavigationLink(value: dog.id) {
                    VStack {
                        AsyncImage(url: URL(string: dog.url)) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 350, height: 350)
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 350, height: 350)
                            case .empty:
                                ProgressView()
                            @unknown default:
                                EmptyView()
                            }
                        }
                        
                        if let breed = dog.breeds.first {
                            Text("\(breed.name)")
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear() {
            Api().loadData { (dogs) in
                self.dogs = dogs
            }
        }
    }
}

#Preview {
    RandomDogView()
}
