//
//  UIImageView+Extension.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience init(cornerRadius: CGFloat, width: CGFloat? = nil, height: CGFloat? = nil, bkColor: UIColor? = nil) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        self.backgroundColor = .lightGray
        
        if let width = width {
            constrainWidth(constant: width)
        }
        
        if let height = height {
            constrainHeight(constant: height)
        }
        
        if let bkColor = bkColor {
            backgroundColor = bkColor
        }
    }
}
