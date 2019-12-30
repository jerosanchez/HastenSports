//
//  PlayersGroup.swift
//  HastenSports
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import Foundation

struct PlayersGroup {
    let name: String
    let players: [Player]
    
    init(name: String, players: [Player]? = nil) {
        self.name = name
        if let players = players {
            self.players = players
        } else {
            self.players = []
        }
    }
}

extension PlayersGroup: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name = "title"
        case players
    }
}
