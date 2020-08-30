//
//  AppDependencyContainer.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

protocol AppDependencyContainerInterface {
    func getSessionService() -> SessionServiceInterface
    func getFactoryService() -> FactoryServiceInterface
    func getProxy() -> HPProxy
}

class AppDependencyContainer: AppDependencyContainerInterface {
    
    private let sessionService: SessionServiceInterface
    private let factoryService: FactoryServiceInterface
    private let proxy: HPProxy
    
    init(proxy: HPProxy) {
        self.proxy = proxy
        self.sessionService = SessionService(proxy: proxy)
        self.factoryService = FactoryService(proxy: proxy)
        self.proxy.set(sessionService: sessionService)
    }

    func getProxy() -> HPProxy {
        return self.proxy
    }
    
    func getSessionService() -> SessionServiceInterface {
        return self.sessionService
    }
    
    func getFactoryService() -> FactoryServiceInterface {
        return self.factoryService
    }
}

extension AppDependencyContainer: SessionServiceDelegate {
}
