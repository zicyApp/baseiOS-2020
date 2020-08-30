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

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

