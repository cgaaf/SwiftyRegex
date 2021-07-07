//
//  File.swift
//  
//
//  Created by Chris Gaafary on 7/6/21.
//

//import Foundation

public extension Regex {
    enum CharacterType: String {
        case allLetters = "a-zA-Z"
        case digitsOnly = #"\d"#
    }
    
    static func characterSet(_ string: String) -> Regex {
        return Regex("[\(string)]")
    }
    
    init(_ type: CharacterType) {
        self.regexString = type.rawValue
    }
    
}
