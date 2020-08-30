//
//  TargetTheme.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

struct TargetTheme {
    static func setup() {
        UIApplication.shared.statusBarView?.backgroundColor = ColorTheme.Primary.tint
    }
}
