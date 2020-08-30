//
//  Theme.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

struct ColorTheme {
    struct Primary {
        static var tint = UIColor(hex: "273A49")
        static var title = UIColor(hex: "333333")
        static var placeholder = UIColor(hex: "f4f4f4")
    }
    struct Secondary {
        static var tint = UIColor(hex: "006BD7") //blue
    }
}

struct FontTheme {
    // swiftlint:disable force_unwrapping
    static var black: ((CGFloat) -> (UIFont)) = { size in
        return UIFont(name: "Raleway-Black", size: size)! //fatal, needed
    }
    static var bold: ((CGFloat) -> (UIFont)) = { size in
        return UIFont(name: "Raleway-Bold", size: size)! //fatal, needed
    }
    static var medium: ((CGFloat) -> (UIFont)) = { size in
        return UIFont(name: "Raleway-Medium", size: size)! //fatal, needed
    }
    static var regular: ((CGFloat) -> (UIFont)) = { size in
        return UIFont(name: "Raleway-Regular", size: size)! //fatal, needed
    }
    static var light: ((CGFloat) -> (UIFont)) = { size in
        return UIFont(name: "Raleway-Light", size: size)! //fatal, needed
    }
    // swiftlint:enable force_unwrapping
}
