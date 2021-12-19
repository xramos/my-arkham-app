//
//  AtLeastUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 19/12/21.
//

import XCTest
@testable import MyArkham

class AtLeastUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func testConvertToDBEntity() {
        
        // Given
        let atleast = AtLeast(id: "1",
                              factions: 1,
                              min: 1)
        
        // When
        let response = atleast.convertToDBEntity()
        
        // Then
        XCTAssertEqual(response.id, atleast.id)
        XCTAssertEqual(response.factions, atleast.factions)
        XCTAssertEqual(response.min, atleast.min)
    }
}
