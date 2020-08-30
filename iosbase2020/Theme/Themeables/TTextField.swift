//
//  TTextField.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

@IBDesignable
class TTextField: UITextField {
    
    var variation: VariationType?
    @IBInspectable
    public var variationName: String? {
        didSet {
            self.variation = VariationHelper.variation(withName: variationName)
            self.variation?.apply(onComponent: self)
        }
    }
}

enum TextFieldVariation: String, Variation {
    typealias Component = UITextField
    
    case primary
    
    static var variations: [TextFieldVariation: VariationBlock] = [
        .primary: { textField in
            textField.tintColor = ColorTheme.Primary.tint.dynamicColor()
            textField.textColor = ColorTheme.Primary.title.dynamicColor()
            if let pointSize = textField.font?.pointSize {
                textField.font = FontTheme.regular(pointSize)
            }
            if let placeholder = textField.placeholder, let pointSize = textField.font?.pointSize {
                textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.font: FontTheme.regular(pointSize),
                                                                                                       NSAttributedString.Key.foregroundColor: ColorTheme.Primary.placeholder])
            }
            textField.keyboardAppearance = .light
        }
    ]
}

extension TTextField: Themeable {
    typealias VariationType = TextFieldVariation
}
