//
//  PlayersListView+Setup.swift
//  HastenSports
//
//  Created by Jero Sánchez on 02/01/2020.
//  Copyright © 2020 Jero Sánchez. All rights reserved.
//

import UIKit

extension PlayersListController {
    func setupView() {
        view.backgroundColor = AppConfig.Colors.sceneBackgroundColor
        
        setupListView()
        setupSpinnerView()
        
        navigationItem.title = AppConfig.appName
    }
    
    private func setupListView() {
        let displayedController = navigationController?.viewControllers.first
        displayedController?.view.addSubviewForAutolayout(tableView)
        tableView.fillSuperview()
        tableView.isHidden = true
    }
    
    private func setupSpinnerView() {
        let scaleSpinner = CGAffineTransform.init(scaleX: 2.5, y: 2.5)
        spinnerView.transform = scaleSpinner

        let displayedController = navigationController?.viewControllers.first
        displayedController?.view.addSubviewForAutolayout(spinnerView)
        spinnerView.centerInSuperview()
        spinnerView.color = .darkGray
        spinnerView.hidesWhenStopped = true
        spinnerView.startAnimating()
    }
}
