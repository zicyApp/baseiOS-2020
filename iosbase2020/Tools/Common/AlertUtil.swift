//
//  AlertUtil.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

open class AlertUtil {
    static func showAlert(_ title: String, msg: String, viewController: UIViewController?) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        alertController.view.tintColor = ColorTheme.Primary.tint.dynamicColor()
        if let vc = viewController {
            vc.present(alertController, animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    static func restartApp() {
        
    }
}
