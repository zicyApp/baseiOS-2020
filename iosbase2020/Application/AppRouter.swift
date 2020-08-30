//
//  AppRouter.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

class AppRouter {
    
    private let app: AppDependencyContainerInterface
    private let activities: [AppActivitiy]
    
    private struct Const {
        static let splashStoryboard = "Splash"
        static let splashViewController = "SplashViewController"
    }
    
    init(app: AppDependencyContainerInterface, activities: [AppActivitiy]) {
        self.activities = activities
        self.app = app
    }
    
    func createRootUI() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc: SplashViewController = ControllerUtils.instantiateVC(forSBName: Const.splashStoryboard, vcId: Const.splashViewController)
        let router = SplashRouter(presented: vc, app: self.app, activities: self.activities)
        let vm = SplashViewModel(delegate: vc, router: router, app: self.app)
        vc.set(viewModel: vm)
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        return window
    }
}
