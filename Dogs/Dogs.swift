//
//  Dogs.swift
//  Dogs
//
//  Created by Maëlys Callens on 29/12/2023.
//

import Foundation

struct Dog: Decodable, Identifiable {
    let id = UUID()
    let breeds: [Breed]
    let url: String
    
    struct Breed: Decodable {
        let name: String
        //let bred_for: String
        //let breed_group: String
        let life_span: String
        let temperament: String
    }
}

class Api : ObservableObject{
    @Published var dogs = [Dog]()
    
    func loadData(completion:@escaping ([Dog]) -> ()) {
        guard let url = URL(string: "https://api.thedogapi.com/v1/images/search?limit=10&api_key=live_Iiozpp62yWi43vdgIR8QbLZh6ZOCIBMBSRy3DlWJsHBXDb9GDetdoXpTJJpYc3m5") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let dogs = try! JSONDecoder().decode([Dog].self, from: data!)
            print(dogs)
            DispatchQueue.main.async {
                completion(dogs)
            }
        }.resume()
    }
}
