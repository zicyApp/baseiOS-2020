//
//  Theme.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

struct ColorTheme {
    enum Primary: String {
        case tint
        case title
        case headerTitle
        case placeholder
        
        func dynamicColor() -> UIColor {
            return ColorTheme.getDynamicColor(colorTheme: self.rawValue, primary: true)
        }
    }
    enum Secondary: String {
        case tint
        
        func dynamicColor() -> UIColor {
            return ColorTheme.getDynamicColor(colorTheme: self.rawValue, primary: true)
        }
    }
    
    static func getDynamicColor(colorTheme: String, primary: Bool) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark: return TargetTheme.getTargetColor(colorTheme: colorTheme, isLight: false, primary: primary)
                default: return TargetTheme.getTargetColor(colorTheme: colorTheme, isLight: true, primary: primary)
                }
            }
        } else {
            return TargetTheme.getTargetColor(colorTheme: colorTheme, isLight: true, primary: primary)
        }
    }
}

struct FontTheme {
    // swiftlint:disable force_unwrapping
    static var black: ((CGFloat) -> (UIFont)) = { size in
        return UIFont.systemFont(ofSize: 17) //fatal, needed
    }
    static var bold: ((CGFloat) -> (UIFont)) = { size in
        return UIFont.boldSystemFont(ofSize: 17) //fatal, needed
    }
    static var medium: ((CGFloat) -> (UIFont)) = { size in
        return UIFont.systemFont(ofSize: 17) //fatal, needed
    }
    static var regular: ((CGFloat) -> (UIFont)) = { size in
        return UIFont.systemFont(ofSize: 17) //fatal, needed
    }
    static var light: ((CGFloat) -> (UIFont)) = { size in
        return UIFont.systemFont(ofSize: 17) //fatal, needed
    }
    // swiftlint:enable force_unwrapping
}
