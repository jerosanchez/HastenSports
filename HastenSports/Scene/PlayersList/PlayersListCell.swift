//
//  PlayersListCell.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit

class PlayersListCell: UITableViewCell {
    
    // MARK: - Subviews
    
    let picture = UIImageView(cornerRadius: 30, width: 60, height: 60, bkColor: .init(white: 0.5, alpha: 0.2))
    let firstname = UILabel(font: .boldSystemFont(ofSize: 16), numberOfLines: 1)
    let lastname = UILabel(font: .boldSystemFont(ofSize: 16), numberOfLines: 1)
    let birthDate = UILabel(font: .systemFont(ofSize: 16), numberOfLines: 1)
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    func configure() {
        picture.image = UIImage(named: "dummy_picture")
        firstname.text = "Firstname"
        lastname.text = "Lastname"
        birthDate.text = "00/00/00"
    }
}
