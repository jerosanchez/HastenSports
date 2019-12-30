//
//  NetworkingService.swift
//  HastenSports
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import Foundation

class NetworkingService {
    
    // MARK: - Singleton
    
    static var shared = NetworkingService()
    
    // MARK: - API
    
    func fetch<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
            
        }.resume()
    }
}
