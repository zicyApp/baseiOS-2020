//
//  ControllerUtils.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//
import UIKit

class ControllerUtils {
    
    static func showError(forController controller: UIViewController, message: String, title: String?) {
        if let presentedVC = controller.presentedViewController {
            print("Warning! try to present error message, and presentedViewController is not nill : \(presentedVC)")
        }
        
        let title = title ?? "Error"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        controller.present(alert, animated: true, completion: nil)
    }
    
    static func instantiateVC<T: UIViewController>(forSBName sbName: String, vcId: String) -> T {
        let storyBoard = UIStoryboard(name: sbName, bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: vcId)
        guard let vcTyped = vc as? T else {
            fatalError("vc init failed for db name : \(sbName) and vc id: \(vcId)")
        }
        
        return vcTyped
    }
}
