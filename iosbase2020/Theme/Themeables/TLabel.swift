//
//  TLabel.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

@IBDesignable
class TLabel: UILabel {
    
    var variation: VariationType?
    @IBInspectable
    public var variationName: String? {
        didSet {
            self.variation = VariationHelper.variation(withName: variationName)
            self.variation?.apply(onComponent: self)
        }
    }
}

enum LabelVariation: String, Variation {
    typealias Component = UILabel
    
    case titleRegular
    case titleBold
    case headerTitle
    
    static var variations: [LabelVariation: VariationBlock] = [
        .titleRegular: { label in
            label.font = FontTheme.regular(label.font.pointSize)
            label.textColor = ColorTheme.Primary.tint.dynamicColor()
        },
        .titleBold: { label in
            label.font = FontTheme.bold(label.font.pointSize)
            label.textColor = ColorTheme.Primary.tint.dynamicColor()
        },
        .headerTitle: { label in
            label.font = FontTheme.bold(label.font.pointSize)
            label.textColor = ColorTheme.Primary.headerTitle.dynamicColor()
        }
    ]
}

extension TLabel: Themeable {
    typealias VariationType = LabelVariation
}
