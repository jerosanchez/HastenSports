//
//  PlayersListNavigator.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import Foundation

extension AppNavigator: PlayersListNavigationLogic {
    
    func navigateToPlayerDetail(player: Player) {
        let detailVC = PlayerDetailController()
        detailVC.player = player
        navController?.pushViewController(detailVC, animated: true)
    }
}
