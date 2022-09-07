import Gen
import XCTest
@testable import EnglishGreetings

final class EnglishGreetingsTests: XCTestCase {
    func testrandomEnglishGreeting() throws {
        xoshiro = Xoshiro(seed: 0)
        XCTAssertEqual(try randomEnglishGreeting("Doga"), "Hi, Doga. Welcome!")
    }
    
    func testrandomEnglishGreetingEmptyString() throws {
        XCTAssertThrowsError(try randomEnglishGreeting("")) { error in
            guard case NameError.EmptyNameArgument(let message) = error else {
                return XCTFail()
            }
            
            XCTAssertEqual(message, "expected a non-empty string")
        }
    }
    
    func testrandomEnglishGreetings() throws {
        xoshiro = Xoshiro(seed: 0)
        XCTAssertEqual(
            try randomEnglishGreetings("Ji-an", "Hiroto", "Somchai"),
            ["Hi, Ji-an. Welcome!", "Hi, Hiroto. Welcome!", "Great to see you, Somchai!"]
        )
    }
    
    func testrandomEnglishGreetingsNoArguments() throws {
        XCTAssertThrowsError(try randomEnglishGreetings()) { error in
            guard case NameError.EmptyNamesArgument(let message) = error else {
                return XCTFail()
            }
            
            XCTAssertEqual(message, "expected at least one name")
        }
    }
    
    func testrandomEnglishGreetingsEmptyString() throws {
        XCTAssertThrowsError(try randomEnglishGreetings("")) { error in
            guard case NameError.EmptyNameArgument(let message) = error else {
                return XCTFail()
            }
            
            XCTAssertEqual(message, "expected a non-empty string")
        }
    }
}
