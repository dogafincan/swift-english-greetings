import XCTest
@testable import EnglishGreetings

final class EnglishGreetingsTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(EnglishGreetings().text, "Hello, World!")
    }
}
