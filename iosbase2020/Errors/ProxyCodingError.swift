//
//  ProxyCodingError.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

struct ProxyCodingError: CustomError {
    
    let orginalContext: Error
    let endPoint: String
    
    init(orginalContext: Error, endPoint: String) {
        self.orginalContext = orginalContext
        self.endPoint = endPoint
        print("ProxyCodingError on \(endPoint): \(orginalContext)")
    }
    
    func getTitle() -> String {
        return ErrorParser.defaultTitle
    }
    
    func getMessage() -> String {
        switch self.orginalContext {
        case is DecodingError:
            return "Invalid Data (decoder)"
        case is EncodingError:
            return "Invalid Data (encoder)"
        case is CodableUtilsError:
            return "Invalid Data"
        default:
            return "Invalid Data"
        }
    }
    
    func getCode() -> Int? {
        return nil
    }
}
