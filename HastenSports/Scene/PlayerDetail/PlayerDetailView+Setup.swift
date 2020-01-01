//
//  PlayerDetailView+Setup.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit

extension PlayerDetailView {
    
    func setupView() {
        backgroundColor = AppConfig.Colors.sceneBackgroundColor
    }
    
    func setupLayout() {
        let pictureStackView = UIStackView(arrangedSubviews:[
            UIView(), pictureImageView, UIView()
        ])
        pictureStackView.distribution = .fillProportionally
        
        let nameStackView = VerticalStackView(arrangedSubviews: [
            firstnameLabel,
            lastnameLabel,
        ], spacing: AppConfig.Layout.superReducedVerticalSpacing)
        nameStackView.alignment = .center
        
        let stackView = VerticalStackView(arrangedSubviews: [
            pictureStackView,
            nameStackView,
            birthDateLabel,
            UIView()
        ], spacing: AppConfig.Layout.standardVerticalSpacing)
        stackView.alignment = .center
        
        addSubviewForAutolayout(stackView)
        
        // safeAreaLayoutGuide is available only as of iOS11;
        // topLayoutGuide used in iOS9 was deprecated,
        // so we have to manually layout top of stack view to skip navigation bar
        let verticalPadding = AppConfig.Layout.standatdVerticalPadding
        let horizontalPadding = AppConfig.Layout.standardHorizontalPadding
        stackView.fillSuperview(padding: .init(top: verticalPadding + 100, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding))
    }
}
