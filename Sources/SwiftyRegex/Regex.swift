//
//  File.swift
//  
//
//  Created by Chris Gaafary on 7/6/21.
//

import Foundation

public struct Regex: RegexConvertible {
    public var regexString: String
    
    public init(_ inputString: String) {
        self.regexString = inputString
    }
    
    public init(@RegexBuilder _ regexBuilder: () -> Regex) {
        self.regexString = regexBuilder().regexString
    }
    
    public func asRegex() -> Regex { self }
}

public struct RegexGroup: RegexConvertible {
    @RegexBuilder public var regexBuilder: () -> Regex
    
    public init(@RegexBuilder _ regexBuilder: @escaping () -> Regex) {
        self.regexBuilder = regexBuilder
    }
    
    public func asRegex() -> Regex {
        let string = "(\(regexBuilder().regexString))"
        return Regex(string)
    }
}

public protocol RegexConvertible {
    func asRegex() -> Regex
}
