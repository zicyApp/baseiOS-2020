//
//  TargetTheme.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

struct TargetTheme {

    static func getTargetColor(colorTheme: String, isLight: Bool, primary: Bool) -> UIColor {
        if primary {
            switch colorTheme {
            case ColorTheme.Primary.tint.rawValue: return UIColor(hex: "333333")
            case ColorTheme.Primary.headerTitle.rawValue: return UIColor(hex: "FFFFFF")
                
            default: return UIColor.red
            }
        } else {
            switch colorTheme {
            case ColorTheme.Secondary.tint.rawValue: return UIColor(hex: "333333")
                
            default: return UIColor.red
            }
        }
    }
    
    static func setup() {
        UIApplication.shared.statusBarView?.backgroundColor = ColorTheme.Primary.tint.dynamicColor()
    }
}
