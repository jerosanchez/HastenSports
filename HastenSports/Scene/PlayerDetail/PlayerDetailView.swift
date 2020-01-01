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
    
    let pictureImageView = UIImageView(cornerRadius: 80, width: 160, height: 160, bkColor: .init(white: 0.5, alpha: 0.2))
    let firstnameLabel = UILabel(font: .boldSystemFont(ofSize: 24), numberOfLines: 1)
    let lastnameLabel = UILabel(font: .boldSystemFont(ofSize: 24), numberOfLines: 1)
    let birthDateLabel = UILabel(font: .systemFont(ofSize: 16), numberOfLines: 1)
    
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
        pictureImageView.sd_setImage(with: URL(string: player.imageUrl), placeholderImage: UIImage(named: "dummy_picture"))
        firstnameLabel.text = player.firstname
        lastnameLabel.text = player.lastname
        if let birthDate = player.birthDate {
            self.birthDateLabel.text = "Birth date: \(birthDate)"
        } else {
            self.birthDateLabel.text = "No birth date available"
        }
    }
}
