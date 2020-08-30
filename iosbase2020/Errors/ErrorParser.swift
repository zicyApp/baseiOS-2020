//
//  ErrorParser.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

protocol CustomError: Error {
    func getTitle() -> String
    func getMessage() -> String
    func getCode() -> Int?
}

class ErrorParser {
    static let defaultMessage = "Error"
    static let defaultTitle = "Error"
    
    let error: Error?
    
    init(withError error: Error?) {
        self.error = error
    }
    
    func getTitle() -> String {
        switch self.error {
        case let customError as CustomError:
            return customError.getTitle()
        default:
            return ErrorParser.defaultTitle
        }
    }
    
    func getMessage() -> String {
        switch self.error {
        case let customError as CustomError:
            return customError.getMessage()
        default:
            return ErrorParser.defaultMessage
        }
    }
    
    func getCode() -> Int? {
        switch self.error {
        case let customError as CustomError:
            return customError.getCode()
        default:
            return nil
        }
    }
}

enum MockError: CustomError {
    func getTitle() -> String {
        return "MOCK TITLE"
    }
    func getMessage() -> String {
        return "MOCK ERROR"
    }
    func getCode() -> Int? {
        return nil
    }
    case mock
}
