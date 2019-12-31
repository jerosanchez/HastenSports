//
//  UILabel+Extension.swift
//  HastenSports
//
//  Created by Jero Sánchez on 31/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String? = "", font: UIFont, numberOfLines: Int = 0) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}
