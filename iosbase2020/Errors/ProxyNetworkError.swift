//
//  ProxyNetworkError.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation
import Networking

struct ProxyNetworkError: CustomError {
    
    private static let defaultMessage = "Network error"
    private static let defaultTitle = "Error occurred"
    
    let orginalContext: Error?
    let endPoint: String
    let errorCode: Int?
    let code: Int?
    let message: String?
    let title: String?
    
    init(orginalContext: FailureJSONResponse, endPoint: String) {
        self.init(orginalContext: orginalContext.error, endPoint: endPoint, statusCode: orginalContext.statusCode,
                  code: orginalContext.dictionaryBody["code"] as? Int,
                  message: orginalContext.dictionaryBody["errorDescription"] as? String,
                  title: orginalContext.dictionaryBody["title"] as? String)
    }
    
    init(orginalContext: Error?, endPoint: String, statusCode: Int?, code: Int?, message: String?, title: String?) {
        self.orginalContext = orginalContext
        self.endPoint = endPoint
        self.code = code
        self.message = message
        self.title = title
        
        var finialSatusCode = statusCode
        
        if let error = orginalContext as NSError? {
            switch error.code {
            case NSURLErrorNotConnectedToInternet:
                finialSatusCode = NSURLErrorNotConnectedToInternet
            case NSURLErrorTimedOut:
                finialSatusCode = NSURLErrorTimedOut
            case NSURLErrorCancelled:
                finialSatusCode = NSURLErrorCancelled
            default:
                break
            }
        }
        
        self.errorCode = finialSatusCode
        print("ProxyNetworkError on \(endPoint)")
    }
    
    func getTitle() -> String {
        return self.title ?? ProxyNetworkError.defaultTitle
    }
    
    func getMessage() -> String {
        guard let errorCode = self.errorCode else {
            return self.message ?? ProxyNetworkError.defaultMessage
        }
        
        switch errorCode {
        case 401:
            return "Unauthorized server request."
        case 500:
            return "There was an internal server error."
        case NSURLErrorNotConnectedToInternet:
            return "PLease make sure you have internet connection."
        case NSURLErrorTimedOut:
            return "Request timed out."
        case NSURLErrorCancelled:
            return "Request has been cancelled."
        default:
            return self.message ?? ProxyNetworkError.defaultMessage
        }
    }
    
    func getCode() -> Int? {
        return self.code
    }
}
