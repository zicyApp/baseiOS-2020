//
//  AppDelegate.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private static let mainRouter = AppRouteCreator().createRoute(forApp: AppDelegate.application)
    
    private static let application: AppDependencyContainerInterface = {
        let ctx: AppCreator.AppCreationContext = AppCreator.AppCreationContext.appWithMockProxy
        return AppCreator().createApp(forContext: ctx)
    }()

    struct AppConfigs {
        // swiftlint:disable force_cast force_unwrapping
        static let CONFIG_API_URL = Bundle.main.infoDictionary!["CONFIG_API_URL"] as! String //fatal, needed
        // static let CONFIG_API_MOCK = Bundle.main.infoDictionary!["CONFIG_API_MOCK"] as! Bool //fatal, needed
        // swiftlint:enable force_cast force_unwrapping
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = AppDelegate.mainRouter.createRootUI()
        TargetTheme.setup()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

}

