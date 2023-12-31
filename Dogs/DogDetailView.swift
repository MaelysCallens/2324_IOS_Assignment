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
        Text("Hello world")
        
//        VStack {
//            AsyncImage(url: URL(string: dog.url)) { phase in
//                switch phase {
//                case .success(let image):
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 350, height: 350)
//                case .failure:
//                    Image(systemName: "photo")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 350, height: 350)
//                case .empty:
//                    ProgressView()
//                @unknown default:
//                    EmptyView()
//                }
//            }
//            VStack(alignment: .leading, spacing: 10) {
//                if let breed = dog.breeds.first {
//                    Text("\(breed.name)")
//                        .font(.headline)
//                    //                            Text("Bred for: \(breed.bred_for)")
//                    //                            Text("Breed group: \(breed.breed_group)")
//                    Text("Life span: \(breed.life_span)")
//                    Text("Temperament: \(breed.temperament)")
//                }
//            }
//        }
    }
}

#Preview {
    DogDetailView()
}

//struct DogDetailView_Previews: PreviewProvider {
//    struct Preview: View {
//        @State private var dog = Dog.first!
//        var body: some View {
//            DogDetailView(dog: $dog)
//        }
//    }
//    
//    static var previews: some View {
//        Preview()
//    }
//}
