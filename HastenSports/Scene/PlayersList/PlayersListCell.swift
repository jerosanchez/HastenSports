//
//  PlayersListCell.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit
import SDWebImage

class PlayersListCell: UITableViewCell {
    
    // MARK: - Subviews
    
    let pictureImageView = UIImageView(cornerRadius: AppConfig.Layout.playersListPictureHeight / 2, width: AppConfig.Layout.playersListPictureHeight, height: AppConfig.Layout.playersListPictureHeight, bkColor: AppConfig.Colors.pictureBackgroundColor)
    let firstnameLabel = UILabel(font: AppConfig.Fonts.playersListBoldFont)
    let lastnameLabel = UILabel(font: AppConfig.Fonts.playersListBoldFont)
    let birthDateLabel = UILabel(font: AppConfig.Fonts.playersListFont)
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func configureWith(_ player: Player) {
        accessoryType = .disclosureIndicator
        
        pictureImageView.sd_setImage(with: URL(string: player.imageUrl), placeholderImage: AppConfig.Images.dummyPlayerPicture)
        firstnameLabel.text = player.firstname
        lastnameLabel.text = player.lastname
        if let birthDate = player.birthDate {
            self.birthDateLabel.text = birthDate
        } else {
            birthDateLabel.text = AppConfig.Literals.blankBirthDate
        }
    }
}
