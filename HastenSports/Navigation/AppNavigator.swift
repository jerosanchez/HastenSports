//
//  AppNavigator.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit

class AppNavigator {
    
    // MARK: - Properties
    
    private(set) var window: UIWindow?
    private(set) var navController: UINavigationController?
    
    // MARK: - API
    
    func start() {
        // Initialize homeController with a different controller
        // to change how the app starts
        let homeController = DependencyContainer.playersListController
        homeController.navigator = self
        navController = UINavigationController(rootViewController: homeController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
