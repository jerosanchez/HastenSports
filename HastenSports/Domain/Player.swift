//
//  Player.swift
//  HastenSports
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import Foundation

struct Player {
    let firstname: String
    let lastname: String
    let imageUrl: String
}

extension Player: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case firstname = "name"
        case lastname = "surname"
        case imageUrl = "image"
    }
}
