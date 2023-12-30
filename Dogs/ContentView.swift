//
//  ContentView.swift
//  Dogs
//
//  Created by Maëlys Callens on 29/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActiveDogView: Bool = false
    @State private var isActiveDogDetailView: Bool = false
    
    @State var dogs = [Dog]()
    
    @State var selectedDog: Dog?
    
    var body: some View {
        
        NavigationSplitView {
            DogView()
            //        } content: {
            //            if let selectedDog {
            //                EditablePaletteList(dog: selectedDog)
            //            }
            //            Text("Choose a store")
            //        } 
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        NavigationLink(destination: RandomDogView()) {
                            Text("Dog of the moment")
                        }
                        
                    }
                }
        } detail: {
            Text("Choose a dog")
        }
    }
}

#Preview {
    ContentView()
}
