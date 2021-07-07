//
//  File.swift
//  
//
//  Created by Chris Gaafary on 7/6/21.
//

import Foundation

public struct Regex {
    public var regexString: String
    
    public init(_ inputString: String) {
        self.regexString = inputString
    }
    
    public init(@RegexBuilder _ regexBuilder: () -> Regex) {
        self.regexString = regexBuilder().regexString
    }
}
