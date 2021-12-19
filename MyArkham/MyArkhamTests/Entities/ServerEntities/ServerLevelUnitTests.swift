//
//  ServerLevelUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 19/12/21.
//

import XCTest
@testable import MyArkham

class ServerLevelUnitTests: XCTestCase {

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
        let serverLevel = ServerLevel(min: 1,
                                      max: 5)
        
        // When
        let response = serverLevel.convertToEntity()
        
        // Then
        XCTAssertEqual(response.min, serverLevel.min)
        XCTAssertEqual(response.max, serverLevel.max)
    }
}
