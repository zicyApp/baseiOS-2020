//
//  SessionService.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation
import UIKit

protocol SessionServiceInterface: class {
    func getAccountToken() -> String?
}

protocol SessionServiceDelegate: class {
}

class SessionService: SessionServiceInterface {
    
    private static let USER_TOKEN = "HPToken"
    private static let USER_KEYCHAIN = "HPUser"
    private static let APP_LANGUAGE = "AppLanguage"
    
    private static let keychain = KeychainAccess()
    private let proxy: HPProxy
        
    init(proxy: HPProxy) {
        self.proxy = proxy
        self.load()
    }
    
    private func load() {
        
    }
    
    func getAccountToken() -> String? {
        if let token = try? SessionService.keychain.getString(identifier: SessionService.USER_TOKEN) {
            return token
        } else {
            return nil
        }
    }
}
