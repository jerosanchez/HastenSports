//
//  HastenSportsRepository.swift
//  HastenSports
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import Foundation

protocol HastenSportsRepository {
    func fetchPlayers(completion: @escaping (Result<[PlayersGroup], Error>) -> ())
}
