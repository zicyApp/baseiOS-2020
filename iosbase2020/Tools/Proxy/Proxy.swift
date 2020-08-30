//
//  Proxy.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit
/// Interface for Proxy.
public protocol Proxy {
    
    /**
     This method is necessary to provide an asynchronous RefreshToken operation.
     - Parameter completion: A completion block that will always be executed when the RefreshToken returns from the networks.
     - Parameter succes: It indicates the succes of the RefreshToken.
     */
    
    func getRefreshToken(completion:@escaping (_ error: Error?) -> Void) -> ProxyRefreshTokenOperation
}

///Empty class to identify a RefreshTokenOperation.
open class ProxyRefreshTokenOperation: AsyncOperation {}

