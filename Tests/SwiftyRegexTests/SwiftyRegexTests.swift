    import XCTest
    @testable import SwiftyRegex

    final class SwiftyRegexTests: XCTestCase {
        func testCharacterSet() {
            XCTAssertEqual(Regex.characterSet("test").regexString, "[test]")
        }
        
        func testNegatedSet() {
            let regex = Regex.buildRegex {
                Regex(set: .letters)
                    .toNegatedSet()
            }
            
            XCTAssertEqual(regex.regexString, #"[^a-zA-Z]([\d])"#)
        }
        
        func testEmailRegex() {
            let regex = Regex.buildRegex {
                Regex(set: .letters, .digits)
                    .length(1...)
                    .beginningOfLine()
                
                Regex("@")
                
                Regex(set: .letters, .digits)
                    .length(1...)
                
                Regex(#"."#)
                
                Regex(set: .letters)
                    .length(1...)
                    .endOfLine()
            }
            
            let testString = #"^[a-zA-Z\d]{1,}@[a-zA-Z\d]{1,}\.[a-zA-Z]{1,}$"#
            

            
            XCTAssertEqual(regex.regexString, testString)
        }
    }
