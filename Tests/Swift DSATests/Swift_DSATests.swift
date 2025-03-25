import XCTest
@testable import Swift_DSA

final class Swift_DSATests: XCTestCase {
    func test_twoSum() throws {
//        let result = twoSum(nums: [2,7,11,15], target: 9)
//        XCTAssertTrue(result )
        let result = twoSum([2,7,11,15], 9)
        XCTAssert(result == [0,1])
    }
}
