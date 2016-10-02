import XCTest
@testable import FSEventStreamWrapper

class FSEventStreamWrapperTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(FSEventStreamWrapper().text, "Hello, World!")
    }


    static var allTests : [(String, (FSEventStreamWrapperTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
