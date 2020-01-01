//
//  PlayersListAssembly.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import Foundation

extension DependencyContainer {
    
    static var playersListController: PlayersListController {
        return PlayersListController(
            dataSource: playersListDataSource,
            viewModel: playersListViewModel)
    }
    
    static var playersListDataSource: PlayersListDataSource {
        return PlayersListDataSource()
    }
    
    static var playersListViewModel: PlayersListViewModel {
        return PlayersListViewModel(
            repository: remoteRepository)
    }
}
