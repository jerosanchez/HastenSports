//
//  PlayerDetailController.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit

class PlayerDetailController: UIViewController {
    
    // MARK: - Properties
    
    var player: Player? {
        didSet {
            guard let player = player else { return }
            sceneView.configureWith(player)
        }
    }
    
    private let sceneView = PlayerDetailView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = sceneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
