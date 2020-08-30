//
//  OperrationError.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

enum OperationError: CustomError {
    func getTitle() -> String {
        return ErrorParser.defaultTitle
    }
    
    func getMessage() -> String {
        switch self {
        case .neverStarted:
            return "Operation did not start"
        }
    }
    
    func getCode() -> Int? {
        return nil
    }
    
    case neverStarted
}

