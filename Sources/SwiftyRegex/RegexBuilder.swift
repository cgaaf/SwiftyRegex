//
//  File.swift
//  
//
//  Created by Chris Gaafary on 7/6/21.
//

import Foundation

@resultBuilder
struct RegexBuilder {
    public static func buildBlock(_ components: Regex...) -> Regex {
        let reducedString = components.reduce("") { result, regex in
            result + regex.regexString
        }
        
        return Regex(reducedString)
    }
}
