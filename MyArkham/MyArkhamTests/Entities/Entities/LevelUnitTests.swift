//
//  LevelUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 19/12/21.
//

import XCTest
@testable import MyArkham

class LevelUnitTests: XCTestCase {

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
        let level = Level(id: "1",
                          min: 0,
                          max: 5)
        
        // When
        let response = level.convertToDBEntity()
        
        // Then
        XCTAssertEqual(response.id, level.id)
        XCTAssertEqual(response.min, level.min)
        XCTAssertEqual(response.max, level.max)
    }
}
