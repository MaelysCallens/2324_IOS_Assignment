//
//  Cats.swift
//  Dogs
//
//  Created by Maëlys Callens on 31/12/2023.
//

import Foundation

struct Cat: Decodable, Identifiable {
    
    let id = UUID()
    let url: String
    
}

class CatApi : ObservableObject{
    @Published var cats = [Cat]()
    
    func loadData(completion:@escaping ([Cat]) -> ()) {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=10&api_key=ive_6wqvbeRzExY8l7JHNoNXlu4Rdbf8u5LFNziXC6wAZpot7VHAH3ov1rPEpf5qcAny") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let cats = try! JSONDecoder().decode([Cat].self, from: data!)
            print(cats)
            DispatchQueue.main.async {
                completion(cats)
            }
        }.resume()
    }
}
