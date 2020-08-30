//
//  AppProxy.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Networking

class AppProxy {
    
    private var sessionService: SessionServiceInterface?
    private var networkCreator: AppNetworkingCreator
    
    init(creator: AppNetworkingCreator) {
        self.networkCreator = creator
    }
    
    private func getSessionService() -> SessionServiceInterface {
        guard  let sessionService = self.sessionService else {
            fatalError("dependy injection on \(self)")
        }
        return sessionService
    }
    
    func getNetworkingNoAuth() -> Networking {
        return self.networkCreator.getNetworkingNoAuth()
    }
    
    func getNetworkingWithAuth() -> Networking {
        let token = self.getSessionService().getAccountToken() ?? ""
        return self.networkCreator.getNetworkingWithAuth(forToken: token)
    }
    
    func canMockResponse() -> Bool {
        return self.networkCreator.canMockResponse()
    }
    
    static func appendUrlParameters(string: String, limit: Int, offset: Int) -> String{
        return "\(string)?limit=\(limit)&offset=\(offset)"
    }
}

extension AppProxy: SessionServiceDelegable {
    func set(sessionService: SessionServiceInterface) {
        self.sessionService = sessionService
    }
}
