//
//  DogDetailView.swift
//  Dogs
//
//  Created by Maëlys Callens on 29/12/2023.
//

import SwiftUI

struct DogDetailView: View {
    
//    @Binding var dog: Dog
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
//        NavigationView {
//                    VStack(alignment: .leading, spacing: 16) {
////                        // Naam van het ras
////                        Text("Name: \($dog.breed.name)")
////                            .font(.title)
//                        
//                        // Afbeelding van de hond
//                        AsyncImage(url: URL(string: dog.url)) { phase in
//                            switch phase {
//                            case .success(let image):
//                                image
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(height: 250)
//                            case .failure:
//                                Image(systemName: "photo")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(height: 250)
//                            case .empty:
//                                ProgressView()
//                                    .frame(height: 250)
//                            @unknown default:
//                                EmptyView()
//                            }
//                        }
//                        
////                        //let bred_for: String
////                        Text("Bred for: \($dog.breed.bred_for)")
////                        
////                        //let breed_group: String
////                        Text("Breed group: \($dog.breed.breed_group)")
////
////                        // Levensduur van het ras
////                        Text("Life Span: \($dog.breed.life_span)")
////                        
////                        //let temperament: String
////                        Text("Temperament: \($dog.breed.temperament)")
//                    }
//                    .padding()
//                    .navigationBarTitle(Text("Dog Details"), displayMode: .inline)
//                }
            }
        }

#Preview {
    DogDetailView()
}
