//
//  RandomDog.swift
//  Dogs
//
//  Created by Maëlys Callens on 30/12/2023.
//

import Foundation

//Codable is used for decoding and encoding the JSON data we get from our API call.
struct RandomDog: Decodable, Identifiable {
    let id = UUID()
    let breeds: [Breed]
    let url: String
    
    struct Breed: Decodable {
        let name: String
        //let bred_for: String
        //let breed_group: String
        let life_span: String
        //let temperament: String
    }
}

class ApiRandomDog : ObservableObject{
    @Published var randomDog = [RandomDog]()
    
    func loadData(completion:@escaping ([RandomDog]) -> ()) {
        guard let url = URL(string: "https://api.thedogapi.com/v1/images/search?api_key=live_Iiozpp62yWi43vdgIR8QbLZh6ZOCIBMBSRy3DlWJsHBXDb9GDetdoXpTJJpYc3m5") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let randomDog = try! JSONDecoder().decode([RandomDog].self, from: data!)
            print(randomDog)
            DispatchQueue.main.async {
                completion(randomDog)
            }
        }.resume()
        
    }
}
