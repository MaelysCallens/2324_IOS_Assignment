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
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                if let dog = dogs.first {
                    VStack(alignment: .leading, spacing: 10) {
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
                                .font(.headline)
//                            Text("Bred for: \(breed.bred_for)")
//                            Text("Breed group: \(breed.breed_group)")
                            Text("Life span: \(breed.life_span)")
                            Text("Temperament: \(breed.temperament)")
                        }
                    }
                    
                } else {
                    ProgressView()
                }
            }
            .navigationBarTitle("Dog of the moment", displayMode: .inline)
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
