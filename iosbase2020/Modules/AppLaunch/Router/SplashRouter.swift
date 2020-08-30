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
    func showFactoryView()
}

class SplashRouter: SplashRouterInterface {
    
    private struct Const {
        static let factoryStoryboard = "Factory"
        static let mainNavigationController = "MainNavigationController"
        static let factoryViewController = "FactoryViewController"
    }
    
    private weak var presented: UIViewController?
    private let app: AppDependencyContainerInterface
    private let activities: [AppActivitiy]
    
    init(presented: UIViewController, app: AppDependencyContainerInterface, activities: [AppActivitiy]) {
        self.presented = presented
        self.app = app
        self.activities = activities
    }
    
    func showFactoryView() {
        let nc: UINavigationController = ControllerUtils.instantiateVC(forSBName: Const.factoryStoryboard, vcId: Const.mainNavigationController)
        guard let vc = nc.topViewController as? FactoryViewController  else {
            fatalError("Route error on \(self)")
        }
        let router = FactoryRouter(presented: vc, app: self.app, activities: self.activities)
        let vm = FactoryViewModel(delegate: vc, router: router, app: self.app)
        vc.set(viewModel: vm)
        nc.modalPresentationStyle = .fullScreen
        self.presented?.present(nc, animated: true, completion: nil)
    }
}

