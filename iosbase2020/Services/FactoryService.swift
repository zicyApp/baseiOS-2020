//
//  FactoryService.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation
import UIKit

protocol FactoryServiceInterface: class {
    func getFactories(request: GetFactoryListRequest, completion: @escaping FactoryLitsComp)
}

class FactoryService: FactoryServiceInterface {
    
    private let proxy: HPProxy
        
    init(proxy: HPProxy) {
        self.proxy = proxy
    }
    
    func getFactories(request: GetFactoryListRequest, completion: @escaping FactoryLitsComp) {
        self.proxy.getFactories(request: request, completionCall: completion)
    }
}
