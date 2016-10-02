import XCTest
@testable import EonilFSEventStreamWrapper

class FSEventStreamWrapperTests: XCTestCase {

    func testWatchingSystemRoot() throws {
        let exp = expectation(description: #function)
        try FileSystemWatch.start(for: ObjectIdentifier(self), paths: ["/"]) { event in
            print(event)
            exp.fulfill()
        }
        waitForExpectations(timeout: 10) { (err: Error?) in
            FileSystemWatch.stop(for: ObjectIdentifier(self))
        }
    }

    static var allTests : [(String, (FSEventStreamWrapperTests) -> () throws -> Void)] {
        return [
            ("testWatchingSystemRoot", testWatchingSystemRoot),
        ]
    }
}
