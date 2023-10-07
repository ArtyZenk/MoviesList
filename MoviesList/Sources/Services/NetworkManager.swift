//
//  NetworkManager.swift
//  MoviesList
//
//  Created by Artyom Guzenko on 29.09.2023.
//

import UIKit

class NetworkManager {

    func fetchData(completion: @escaping (Character) -> Void) {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data, error == nil else {
                print(error?.localizedDescription ?? "error description is unavailable")
                return
            }
            
            let characters = try? JSONDecoder().decode(Character.self, from: data)
            
            completion(characters!)
        }.resume()
    }
}

class ImageManager {
    func fetchImage(from url: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: url) else { return }
        guard let data = try? Data(contentsOf: url) else { return }

        completion(data)
    }
}

