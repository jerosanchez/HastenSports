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
    
    let pictureImageView = UIImageView(cornerRadius: 30, width: 60, height: 60, bkColor: .init(white: 0.5, alpha: 0.2))
    let firstnameLabel = UILabel(font: .boldSystemFont(ofSize: 16), numberOfLines: 1)
    let lastnameLabel = UILabel(font: .boldSystemFont(ofSize: 16), numberOfLines: 1)
    let birthDateLabel = UILabel(font: .systemFont(ofSize: 16), numberOfLines: 1)
    
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
        
        pictureImageView.sd_setImage(with: URL(string: player.imageUrl), placeholderImage: UIImage(named: "dummy_picture"))
        firstnameLabel.text = player.firstname
        lastnameLabel.text = player.lastname
        if let birthDate = player.birthDate {
            self.birthDateLabel.text = birthDate
        } else {
            birthDateLabel.text = ""
        }
    }
}
