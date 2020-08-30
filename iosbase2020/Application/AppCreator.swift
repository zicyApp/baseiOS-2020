//
//  AppCreator.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

class AppCreator {
    
    enum AppCreationContext {
        case testingUI
        case testingUIWithAutoLogin
        case app
        case appWithMockProxy
    }
    
    func createApp(forContext context: AppCreationContext) -> AppDependencyContainerInterface {
        /*switch context {
        case .testingUI:
            // return MockAppDependencyContainer(shouldAutoLog: false)
            return AppDependencyContainer()
        case .testingUIWithAutoLogin:
            // return MockAppDependencyContainer(shouldAutoLog: true)
            return AppDependencyContainer()
        case .app:
            return AppDependencyContainer()
        case .appWithMockProxy:
            return AppDependencyContainer()
        }*/
        return AppDependencyContainer(proxy: createRealProxy())
    }
    
    private func createRealProxy() -> HPProxy {
        let creator = AppNetworkingCreator(baseUrl: AppDelegate.AppConfigs.CONFIG_API_URL, isMock: false)
        return AppProxy(creator: creator)
    }
}
