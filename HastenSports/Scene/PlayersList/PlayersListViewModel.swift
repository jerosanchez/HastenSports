//
//  PlayersListViewModel.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import Foundation

class PlayersListViewModel {
    
    // MARK: - Properties
    
    var playersGroups = Observable<[PlayersGroup]>(value: [])
    
    var loadError = Observable<Error?>(value: nil)
    
    // MARK: - Dependencies
    
    private let repository: HastenSportsRepository
    
    // MARK: - Initialization
    
    init(repository: HastenSportsRepository) {
        self.repository = repository
    }
    
    // MARK: - API
    
    func loadPlayers() {
        repository.fetchPlayers { result in
            switch result {
            case .success(let playersGroups):
                self.playersGroups.value = playersGroups
            case .failure(let error):
                self.loadError.value = error
            }
        }
    }
}
