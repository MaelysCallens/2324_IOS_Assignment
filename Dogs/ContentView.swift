//
//  ContentView.swift
//  Dogs
//
//  Created by Maëlys Callens on 29/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showToolbar = false
 
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
                    if showToolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            NavigationLink(destination: RandomDogView()) {
                                Text("Dog of the moment")
                            }
                            
                        }
                    }
                }
                .onAppear {
                    // Start een timer van 10 seconden om de toolbar te laten verschijnen
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        withAnimation {
                            showToolbar = true
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
