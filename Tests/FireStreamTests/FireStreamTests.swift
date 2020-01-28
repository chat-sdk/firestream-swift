import XCTest
@testable import FireStream

final class FireStreamTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FireStream().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
