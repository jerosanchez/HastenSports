//
//  PlayerDetailView.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit

class PlayerDetailView: UIView {
    
    // MARK: - Subviews
    
    let pictureImageView = UIImageView(cornerRadius: AppConfig.Layout.playerDetailPictureHeight / 2, width: AppConfig.Layout.playerDetailPictureHeight, height: AppConfig.Layout.playerDetailPictureHeight, bkColor: AppConfig.Colors.pictureBackgroundColor)
    let firstnameLabel = UILabel(font: AppConfig.Fonts.playerDetailBoldFont)
    let lastnameLabel = UILabel(font: AppConfig.Fonts.playerDetailBoldFont)
    let birthDateLabel = UILabel(font: AppConfig.Fonts.playerDetailFont)
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func configureWith(_ player: Player) {
        pictureImageView.sd_setImage(with: URL(string: player.imageUrl), placeholderImage: AppConfig.Images.dummyPlayerPicture)
        firstnameLabel.text = player.firstname
        lastnameLabel.text = player.lastname
        if let birthDate = player.birthDate {
            self.birthDateLabel.text = "\(AppConfig.Literals.birthDate): \(birthDate)"
        } else {
            self.birthDateLabel.text = AppConfig.Literals.noBirthDateAvailable
        }
    }
}
