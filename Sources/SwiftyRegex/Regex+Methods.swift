//
//  File.swift
//  
//
//  Created by Chris Gaafary on 7/6/21.
//

import Foundation

public extension Regex {
    func toCharacterSet() -> Regex {
        let string = "[\(self.regexString)]"
        return Regex(string)
    }
    
    func toNegatedSet() -> Regex {
        let string = "[^\(self.regexString)]"
        return Regex(string)
    }
    
    func beginningOfLine() -> Regex {
        let str = "^\(self.regexString)"
        return Regex(str)
    }
    
    func endOfLine() -> Regex {
        let str = "\(self.regexString)$"
        return Regex(str)
    }
    
}


