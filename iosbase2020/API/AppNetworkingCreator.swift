//
//  AppNetworkingCreator.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Networking

class AppNetworkingCreator {
    
    private struct Const {
        static let jpeg = "jpeg"
        static let defaultTimeoutIntervalForRequest: TimeInterval = 30
    }
    
    struct JPEGMultipartInfos {
        let endPoint: String
        let fileParamName: String
        let data: Data
        let token: String
    }
    
    private let baseURL: String
    private let isMockNetworking: Bool
    
    init(baseUrl: String, isMock: Bool) {
        self.baseURL = baseUrl
        self.isMockNetworking = isMock
    }
    
    func getNetworkingNoAuth() -> Networking {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = Const.defaultTimeoutIntervalForRequest
        let networking = Networking(baseURL: self.baseURL, configuration: config)
        self.addHeaderFields(networking: networking)
        return networking
    }
    
    func getNetworkingWithAuth(forToken token: String) -> Networking {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = Const.defaultTimeoutIntervalForRequest
        let networking = Networking(baseURL: self.baseURL, configuration: config)
        self.addHeaderFields(networking: networking, token: token)
        return networking
    }
    
    func canMockResponse() -> Bool {
        return self.isMockNetworking
    }
    
    private func addHeaderFields(networking: Networking, token: String? = nil) {
        networking.headerFields = ["Accept-Language": Locale.appLocaleString()]
        if let dictionary = Bundle.main.infoDictionary, let build = dictionary["CFBundleVersion"] as? String {
            networking.headerFields?["App-Version"] =  build
        }
        if let token = token {
            networking.headerFields?["Authorization"] = "Bearer " + token
        }
    }
    
}
