//
//  DogsApp.swift
//  Dogs
//
//  Created by Maëlys Callens on 29/12/2023.
//

import SwiftUI

@main
struct DogsApp: App {
    
    @AppStorage("showMenuBarExtra") private var showMenuBarExtra = true
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
              CommandMenu("My Top Menu") {
                Button("Sub Menu Item") { print("You pressed sub menu.") }
                  .keyboardShortcut("S")
              }
              CommandGroup(replacing: .pasteboard) {
                Button("Cut") { print("Cutting something...") }
                  .keyboardShortcut("X")
                Button("Copy") { print("Copying something...") }
                  .keyboardShortcut("C")
                Button("Paste") { print("Pasting something...") }
                  .keyboardShortcut("V")
                Button("Paste and Match Style") { print("Pasting and Matching something...") }
                  .keyboardShortcut("V", modifiers: [.command, .option, .shift])
                Button("Delete") { print("Deleting something...") }
                  .keyboardShortcut(.delete)
                Button("Select All") { print("Selecting something...") }
                  .keyboardShortcut("A")
              }
            }
//        .commands {
//            CommandGroup(after: CommandGroupPlacement.appVisibility) {
//                Button("Menu Item 1", action: {
//                    // Voeg de acties toe die je wilt uitvoeren wanneer Menu Item 1 wordt geselecteerd
//                    print("Menu Item 1 geselecteerd")
//                })
//
//                Button("Menu Item 2", action: {
//                    // Voeg de acties toe die je wilt uitvoeren wanneer Menu Item 2 wordt geselecteerd
//                    print("Menu Item 2 geselecteerd")
//                })
//            }
//        }
    }
}
