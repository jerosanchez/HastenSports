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
    
    private let sceneView = PlayerDetailView()
    
    // MARK: - Initialization
    
    init(player: Player) {
        super.init(nibName: nil, bundle: nil)
        
        sceneView.configureWith(player)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = sceneView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
