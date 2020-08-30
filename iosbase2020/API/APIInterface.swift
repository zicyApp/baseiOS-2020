//
//  APIInterface.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import UIKit

typealias EmptyResultComp = (_ result: Result<EmptyResult>) -> Void
typealias FactoryLitsComp = (_ result: Result<GetFactoryListResponse>) -> Void

protocol APIInterface: class {
    func getFactories(request: GetFactoryListRequest, completionCall: @escaping FactoryLitsComp)
}

protocol SessionServiceDelegable {
    func set(sessionService: SessionServiceInterface)
}

typealias HPProxy = APIInterface & SessionServiceDelegable
