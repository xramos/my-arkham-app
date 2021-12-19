//
//  ServerAtLeastUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 19/12/21.
//

import XCTest
@testable import MyArkham

class ServerAtLeastUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func testConvertToEntity() {
        
        // Given
        let serverAtLeast = ServerAtLeast(factions: 3,
                                          min: 1)
        
        // When
        let response = serverAtLeast.convertToEntity()
        
        // Then
        XCTAssertEqual(response.factions, serverAtLeast.factions)
        XCTAssertEqual(response.min, serverAtLeast.min)
    }
}
