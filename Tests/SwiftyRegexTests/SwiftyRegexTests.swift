    import XCTest
import Foundation
    @testable import SwiftyRegex

    final class SwiftyRegexTests: XCTestCase {
        func testCharacterSet() {
            XCTAssertEqual(Regex.characterSet("test").regexString, "[test]")
        }
        
        func testEmailRegex() {
            let regex1 = Regex.buildRegex {
                Regex(set: .letters, .digits)
                    .length(1...)
                    .beginningOfLine()
                
                Regex("@")
                
                Regex(set: .letters, .digits)
                    .length(1...)
                
                Regex(".")
                
                Regex(set: .letters)
                    .length(1...)
                    .endOfLine()
            }
            
            let testString = #"^[a-zA-Z\d]{1,}@[a-zA-Z\d]{1,}\.[a-zA-Z]{1,}$"#
            XCTAssertEqual(regex1.regexString, testString)
        }
        
        func testNSPredicate() {
            let regex2 = Regex.buildRegex {
                Regex(set: .letters, .digits, .character("."), .character("%+_-"))
                    .length(1...)
                
                Regex("@")
                
                Regex(set: .letters, .digits, .character(".-"))
                    .length(1...)
                
                Regex(".")
                
                Regex(set: .letters)
                    .length(2...64)
                
            }
            
            let predicate = NSPredicate(format: "SELF MATCHES %@", regex2.regexString)
            let email1 = "chris@mail.com"
            let email2 = "chris_g@mail.com"
            let email3 = "chris+g.test@mail12.com"
            
            [email1, email2, email3].forEach { email in
                XCTAssertTrue(predicate.evaluate(with: email))
            }
        }
    }
