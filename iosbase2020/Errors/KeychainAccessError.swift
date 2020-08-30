//
//  KeychainAccessError.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

struct KeychainAccessError: CustomError {
    
    let error: OSStatus
    
    func getTitle() -> String {
        return ErrorParser.defaultTitle
    }
    
    func getMessage() -> String {
        return "Keychain error occurred"
    }
    
    func getCode() -> Int? {
        return nil
    }
}

enum KeychainDataError: CustomError {
    
    case stringFormatNotValid
    
    func getTitle() -> String {
        return ErrorParser.defaultTitle
    }
    
    func getMessage() -> String {
        switch self {
        case .stringFormatNotValid:
            return "Invalid format error occurred"
        }
    }
    
    func getCode() -> Int? {
        return nil
    }
}
