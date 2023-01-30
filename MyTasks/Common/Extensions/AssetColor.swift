//
//  AssetColor.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

// MARK: - Constants

enum AssetColor {

    static let clear = UIColor.clear
    static let gray = UIColor(rgb: 0x72787A)
    static let white = UIColor(rgb: 0xFFFFFF)
    static let black = UIColor(rgb: 000000)
    static let blue = UIColor(rgb: 0x0650C2)

}

// MARK: - Configure Appearance

extension UIColor {

    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
