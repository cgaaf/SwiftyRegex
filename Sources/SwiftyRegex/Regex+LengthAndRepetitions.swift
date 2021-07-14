//
//  File.swift
//  
//
//  Created by Chris Gaafary on 7/13/21.
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
    
    func length(min: Int? = nil, max: Int? = nil) -> Regex {
        let minAndMaxAreNil = (min == nil && max == nil)
        assert(minAndMaxAreNil == false)
        
        if let min = min {
            if let max = max {
                assert(min < max)
            }
        }
        
        var outputString = ""
        
        switch (min, max) {
        case (.some(let minValue), .none):
            outputString = "{\(minValue),}"
        case (.none, .some(let maxValue)):
            outputString = "{,\(maxValue)}"
        case (.some(let minValue), .some(let maxValue)):
            outputString = "{\(minValue), \(maxValue)}"
        case (.none, .none):
            return self
        }
        
        return Regex(outputString)
    }
    
    func length(_ range: ClosedRange<Int>) -> Regex {
        repetitions(range)
    }
    
    func length(_ partialRangeFrom: PartialRangeFrom<Int>) -> Regex {
        repetitions(partialRangeFrom)
    }
    
    func length(_ partialRangeTo: PartialRangeThrough<Int>) -> Regex {
        repetitions(partialRangeTo)
    }
}
