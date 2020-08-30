//
//  CodableUtils.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

public enum CodableUtilsError: Error {
    case invalidString
    case impossibleToEncodeString
}

open class CodableUtils {
    
    public static func getNewEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        return encoder
    }
    
    public static func getNewDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }
    
    public static func parseJSONObject<T: Codable>(body: Any) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        let object: T = try CodableUtils.parseJSONObject(body: data)
        return object
    }
    
    public static func parseJSONObject<T: Codable>(body: Data) throws -> T {
        let object = try CodableUtils.getNewDecoder().decode(T.self, from: body)
        return object
    }
    
    public static func parseJSONObject<T: Codable>(body: String) throws -> T {
        if let data = body.data(using: .utf8) {
            let object: T = try CodableUtils.parseJSONObject(body: data)
            return object
        } else {
            throw CodableUtilsError.invalidString
        }
    }
    
    public static func convertToJSON<T: Codable>(object: T) throws -> Any {
        let data =  try CodableUtils.getNewEncoder().encode(object)
        let JSONObject = try JSONSerialization.jsonObject(with: data)
        return JSONObject
    }
    
    public static func convertToString<T: Codable>(object: T) throws -> String {
        let data =  try CodableUtils.getNewEncoder().encode(object)
        if let JSONString = String(data: data, encoding: .utf8) {
            return JSONString
        } else {
            throw CodableUtilsError.impossibleToEncodeString
        }
    }
}
