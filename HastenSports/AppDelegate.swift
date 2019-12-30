//
//  AppDelegate.swift
//  HastenSports
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let homeController = HomeController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeController
        window?.makeKeyAndVisible()
        
        return true
    }
}

