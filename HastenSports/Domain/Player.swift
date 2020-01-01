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
    let birthDate: String?
    
    init(firstname: String, lastname: String, imageUrl: String, birthDate: String? = nil) {
        
        self.firstname = firstname
        self.lastname = lastname
        self.imageUrl = imageUrl
        self.birthDate = birthDate
    }
}

extension Player: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case firstname = "name"
        case lastname = "surname"
        case imageUrl = "image"
        case birthDate = "date"
    }
}

extension Player: Equatable { }
