//
//  File.swift
//  
//
//  Created by Chris Gaafary on 7/13/21.
//

public extension Regex {
    enum CharacterType: Hashable {
        case character(String)
        case letters
        case digits
        case nonDigits
        case wordCharacters
        case nonWordCharacters
        case whitespaces
        case nonWhitespaces
        
        var string: String {
            switch self {
                
            case .character(let char): return char
            case .letters: return "a-zA-Z"
            case .digits: return #"\d"#
            case .nonDigits: return #"\D"#
            case .wordCharacters: return #"\w"#
            case .nonWordCharacters: return #"\W"#
            case .whitespaces: return #"\s"#
            case .nonWhitespaces: return #"\S"#
                
            }
        }
    }
    
    static func characterSet(_ string: String) -> Regex {
        return Regex("[\(string)]")
    }
    
    init(set types: CharacterType...) {
        let joinedString = types.map(\.string).joined()
        self.init("[\(joinedString)]")
    }
    
}
