//
//  PlayersListCell+Setup.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit

extension PlayersListCell {
    
    func setupLayout() {
        let pictureStackView = VerticalStackView(arrangedSubviews: [
            UIView(), picture, UIView()
        ])
        pictureStackView.distribution = .equalCentering
        
        let nameStackView = VerticalStackView(arrangedSubviews: [
            UIView(), firstname, lastname, UIView()
        ], spacing: 8)
        nameStackView.distribution = .equalCentering
        
        let cellStackView = UIStackView(arrangedSubviews: [
            pictureStackView,
            nameStackView,
            birthDate
        ], customSpacing: 16)
        
        birthDate.textAlignment = .right
        
        contentView.addSubviewForAutolayout(cellStackView)
        cellStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
}
