//
//  SplashRouter.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation
import UIKit

protocol SplashRouterInterface: class {
    func showHomeView()
}

class SplashRouter: SplashRouterInterface {
    
    private struct Const {
        static let homeStoryboard = "Home"
        static let mainNavigationController = "MainNavigationController"
        static let homeViewController = "HomeViewController"
    }
    
    private weak var presented: UIViewController?
    private let app: AppDependencyContainerInterface
    private let activities: [AppActivitiy]
    
    init(presented: UIViewController, app: AppDependencyContainerInterface, activities: [AppActivitiy]) {
        self.presented = presented
        self.app = app
        self.activities = activities
    }
    
    func showHomeView() {
        
    }
}

