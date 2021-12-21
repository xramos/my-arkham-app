//
//  DBLevelUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 21/12/21.
//

import XCTest
@testable import MyArkham

class DBLevelUnitTests: XCTestCase {

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
        let dbLevel = DBLevel(id: "1",
                              min: 1,
                              max: 5)
        
        // When
        let response = dbLevel.convertToEntity()
        
        // Then
        XCTAssertEqual(response.id, dbLevel.id)
        XCTAssertEqual(response.min, dbLevel.min)
        XCTAssertEqual(response.max, dbLevel.max)
    }
}
