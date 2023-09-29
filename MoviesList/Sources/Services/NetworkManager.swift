//
//  NetworkManager.swift
//  MoviesList
//
//  Created by Artyom Guzenko on 29.09.2023.
//

import Foundation

class NetworkManager {

    func configuration() {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard error == nil else { return }
            guard let data else { return }
            
        }
        
    }
}
