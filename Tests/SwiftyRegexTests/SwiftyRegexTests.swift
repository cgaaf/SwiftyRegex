    import XCTest
    @testable import SwiftyRegex

    final class SwiftyRegexTests: XCTestCase {
        func testCharacterSet() {
            XCTAssertEqual(Regex.characterSet("test").regexString, "[test]")
        }
        
        func testNegatedSet() {
            let regex = Regex {
                Regex(.allLetters)
                    .toNegatedSet()
                
                RegexGroup {
                    Regex(.digitsOnly)
                        .toCharacterSet()
                }
            }
            
            XCTAssertEqual(regex.regexString, #"[^a-zA-Z]([\d])"#)
        }
    }
