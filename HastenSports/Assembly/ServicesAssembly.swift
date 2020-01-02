//
//  ServicesAssembly.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import Foundation

extension DependencyContainer {
    
    static var networkingService: NetworkingService {
        return URLSessionNetworkingService()
    }
}
