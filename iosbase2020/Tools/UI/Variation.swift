//
//  Variation.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation
import UIKit

protocol Variation: Hashable, RawRepresentable where RawValue == String {
    
    associatedtype Component
    typealias VariationBlock = ((Component) -> Void)
    static var variations: [Self: VariationBlock] {get}
    func apply(onComponent component: Component)
}

extension Variation {
    func apply(onComponent component: Component) {
        if let block = Self.variations[self] {
            block(component)
        } else {
            print("no variation block for case \(self.rawValue) on \(self)")
        }
    }
}

protocol Themeable {
    associatedtype VariationType: Variation
}

class VariationHelper {
    static func variation<T: Variation>(withName name: String?) -> T? {
        guard let name = name else { return nil }
        guard let variation = T(rawValue: name) else {
            print("Warning no variation named: \(name)")
            return nil
        }
        return variation
    }
}

extension UIView {
    func variation<T: Variation>(withName name: String?) -> T? {
        return VariationHelper.variation(withName: name)
    }
}

