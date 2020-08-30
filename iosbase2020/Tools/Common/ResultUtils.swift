//
//  ResultUtils.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

enum Result<SuccessType> {
    case success(value: SuccessType)
    case error(error: Error?)
}

struct EmptyResult {}

protocol ResultProvider {
    associatedtype ResultType
    var dataResult: Result<ResultType> {get}
}
