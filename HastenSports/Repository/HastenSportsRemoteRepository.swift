//
//  HastenSportsRemoteRepository.swift
//  HastenSports
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import Foundation

class HastenSportsRemoteRepository: HastenSportsRepository {
    
    // MARK: - Traits
    
    private let apiUrlString = "https://api.myjson.com/bins/66851"
    
    // MARK: - Properties
    
    private let networkingService: NetworkingService
    
    // MARK: - Initialization
    
    init(networkingService: NetworkingService) {
        self.networkingService = networkingService
    }
    
    // MARK: - Implementation
    
    func fetchPlayers(completion: @escaping (Result<[PlayersGroup], Error>) -> ()) {
        
        networkingService.fetch(urlString: apiUrlString) { (result: Result<[PlayersGroup], Error>) in
            switch result {
            case .success(let groups):
                completion(.success(groups))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
