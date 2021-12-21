//
//  DBAtLeastUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 21/12/21.
//

import XCTest
@testable import MyArkham

class DBAtLeastUnitTests: XCTestCase {

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
        let dbAtleast = DBAtLeast(id: "1",
                                  factions: 3,
                                  min: 1)
        
        // When
        let response = dbAtleast.convertToEntity()
        
        // Then
        XCTAssertEqual(response.id, dbAtleast.id)
        XCTAssertEqual(response.factions, dbAtleast.factions)
        XCTAssertEqual(response.min, dbAtleast.min)
    }
}
