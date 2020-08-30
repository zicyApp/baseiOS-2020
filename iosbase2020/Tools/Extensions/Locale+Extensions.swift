//
//  Locale+Extensions.swift
//  iosbase2020
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import Foundation

public enum AppLanguage {
    case french(locale: String)
    case english(locale: String)
}

public extension Locale {
    static func appLocale() -> AppLanguage {
        var lang: AppLanguage = .english(locale: "en")
        let languages = Locale.preferredLanguages //Bundle.main.preferredLocalizations
        
        for language in languages {
            if language.lowercased().hasPrefix("fr") == true {
                lang = .french(locale: language)
                break
            } else if language.lowercased().hasPrefix("en") == true {
                lang = .english(locale: language)
                break
            }
        }
        
        return lang
    }
    
    static func appLocaleString() -> String {
        switch Locale.appLocale() {
        case .french(locale: let locale),
             .english(locale: let locale):
            return locale
        }
    }
    
    static func appLocaleCurrencyString() -> String {
        switch Locale.appLocale() {
        case .french:
            return "fr"
        case .english:
            return "en"
        }
    }
    
    func language() -> AppLanguage {
        var lang: AppLanguage = .english(locale: "en")
        
        if self.identifier.lowercased().hasPrefix("fr") == true {
            lang = .french(locale: self.identifier)
        } else if self.identifier.lowercased().hasPrefix("en") == true {
            lang = .english(locale: self.identifier)
        }
        
        return lang
    }
}
