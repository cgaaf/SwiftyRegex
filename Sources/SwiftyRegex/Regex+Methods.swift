//
//  File.swift
//  
//
//  Created by Chris Gaafary on 7/6/21.
//

import Foundation

public extension Regex {
    func repetitions(_ number: Int) -> Regex {
        let string = "\(self.regexString){\(number)}"
        return Regex(string)
    }
    
    func repetitions(_ range: ClosedRange<Int>) -> Regex {
        let bounds = "{\(range.lowerBound),\(range.upperBound)}"
        let string = "\(self.regexString)\(bounds)"
        return Regex(string)
    }
    
    func repetitions(_ partialRangeFrom: PartialRangeFrom<Int>) -> Regex {
        let bounds = "{\(partialRangeFrom.lowerBound),}"
        let string = "\(self.regexString)\(bounds)"
        return Regex(string)
    }
    
    func repetitions(_ partialRangeTo: PartialRangeThrough<Int>) -> Regex {
        let bounds = "{,\(partialRangeTo.upperBound)}"
        let string = "\(self.regexString)\(bounds)"
        return Regex(string)
    }
    
    func matchAny() -> Regex {
        let string = "[\(self.regexString)]"
        return Regex(string)
    }
    
    func matchAbsent() -> Regex {
        let string = "[^\(self.regexString)]"
        return Regex(string)
    }
}
