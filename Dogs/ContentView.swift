//
//  ContentView.swift
//  Dogs
//
//  Created by Maëlys Callens on 29/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var dogs = [Dog]()
    
    var body: some View {
        NavigationView {
            List(dogs) { dog in
                ForEach(dog.breeds, id: \.name) { breed in
                    Text("\(breed.name)")
                }
            }.onAppear() {
                Api().loadData { (dogs) in
                    self.dogs = dogs
                }
            }.navigationTitle("Dog List")
        }
    }
}

#Preview {
    ContentView()
}
