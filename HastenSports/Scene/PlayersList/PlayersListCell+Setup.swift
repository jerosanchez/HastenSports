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
            UIView(), pictureImageView, UIView()
        ])
        pictureStackView.distribution = .equalCentering
        
        let nameStackView = VerticalStackView(arrangedSubviews: [
            UIView(), firstnameLabel, lastnameLabel, UIView()
        ], spacing: AppConfig.Layout.reducedVerticalSpacing)
        nameStackView.distribution = .equalCentering
        
        let cellStackView = UIStackView(arrangedSubviews: [
            pictureStackView,
            nameStackView,
            birthDateLabel
        ], customSpacing: AppConfig.Layout.standardVerticalSpacing)
        
        birthDateLabel.textAlignment = .right
        
        contentView.addSubviewForAutolayout(cellStackView)
        let horizontalPadding = AppConfig.Layout.standardHorizontalPadding
        let verticalPadding = AppConfig.Layout.standatdVerticalPadding
        cellStackView.fillSuperview(padding: .init(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding))
    }
}
