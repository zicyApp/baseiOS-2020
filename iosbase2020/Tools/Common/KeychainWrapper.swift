//
//  KeychainWrapper.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Security
import UIKit

let kSecClassGenericPasswordValue =  kSecClassGenericPassword as String
let kSecClassValue = kSecClass as String
let kSecAttrServiceValue = kSecAttrService as String
let kSecValueDataValue =  kSecValueData as String
let kSecMatchLimitValue = kSecMatchLimit as String
let kSecReturnDataValue =  kSecReturnData as String
let kSecMatchLimitOneValue = kSecMatchLimitOne as String
let kSecAttrAccountValue = kSecAttrAccount as String

class KeychainAccess {
    
    func setString(identifier: String, stringToSave: String) throws {
        
        guard  let dataFromString = stringToSave.data(using: String.Encoding.utf8) else {
            throw KeychainDataError.stringFormatNotValid
        }
        
        // Instantiate a new default keychain query
        let keychainQuery = [
            kSecClassValue: kSecClassGenericPasswordValue,
            kSecAttrServiceValue: identifier,
            kSecValueDataValue: dataFromString
            ] as CFDictionary
        
        // Delete any existing items
        SecItemDelete(keychainQuery)
        // Add the new keychain item
        let status = SecItemAdd(keychainQuery, nil)
        
        guard status == errSecSuccess else {
            print("Saving KeychainAccess error code is: \(status)")
            throw KeychainAccessError(error: status)
        }
        
        print("Saving KeychainAccess success!")
        
    }
    
    func deleteString(atIdentifier identifier: String) throws {
        let keychainQuery = [
            kSecClassValue: kSecClassGenericPasswordValue,
            kSecAttrServiceValue: identifier
            ] as CFDictionary
        
        // Delete any existing items
        let status =  SecItemDelete(keychainQuery)
        
        guard status == errSecSuccess else {
            print("Deleting KeychainAccess error code is: \(status)")
            throw KeychainAccessError(error: status)
        }
        print("Deleting KeychainAccess success!")
    }
    
    func getString(identifier: String) throws -> String {
        let keychainQuery = [
            kSecClassValue: kSecClassGenericPasswordValue,
            kSecAttrServiceValue: identifier,
            kSecReturnDataValue: kCFBooleanTrue ?? false,
            kSecMatchLimitValue: kSecMatchLimitOneValue
            ] as  CFDictionary
        
        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(keychainQuery, &dataTypeRef)
        
        guard status == errSecSuccess else {
            print("get string KeychainAccess error code is: \(status)")
            throw KeychainAccessError(error: status)
        }
        
        guard
            let retrievedData = dataTypeRef as? Data,
            let result = String(data: retrievedData, encoding: String.Encoding.utf8) else {
                throw KeychainDataError.stringFormatNotValid
        }
        print("get string  KeychainAccess success!")
        
        return result
    }
}
