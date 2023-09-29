//
//  NetworkManager.swift
//  MoviesList
//
//  Created by Artyom Guzenko on 29.09.2023.
//

import Foundation

class NetworkManager {

    func getData(completion: @escaping (Character) -> Void ) {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data, error == nil else { return }
            
            let characters = try? JSONDecoder().decode(Character.self, from: data)
            
            completion(characters!)
        }.resume()
    }
}
