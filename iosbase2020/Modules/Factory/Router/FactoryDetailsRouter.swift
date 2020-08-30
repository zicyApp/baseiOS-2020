//
//  FactoryDetailsRouter.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

protocol FactoryDetailsRouterInterface {
    
}

class FactoryDetailsRouter: FactoryDetailsRouterInterface {
    
    private struct Const {
        static let factoryStoryboard = "Factory"
    }
    
    private weak var presented: UIViewController?
    private let app: AppDependencyContainerInterface
    private let activities: [AppActivitiy]
    
    init(presented: UIViewController, app: AppDependencyContainerInterface, activities: [AppActivitiy]) {
        self.presented = presented
        self.app = app
        self.activities = activities
    }
}
