//
//  NetworkingService.swift
//  HastenSports
//
//  Created by Jero Sánchez on 02/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import Foundation

protocol NetworkingService {
    func fetch<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> ())
}
