//
//  FactionUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 19/12/21.
//

import XCTest
@testable import MyArkham

class FactionUnitTests: XCTestCase {

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
        let faction = Faction(id: "1",
                              code: "code",
                              name: "name",
                              isPrimary: true)
        
        // When
        let response = faction.convertToDBEntity()
        
        // Then
        XCTAssertEqual(response.id, faction.id)
        XCTAssertEqual(response.code, faction.code)
        XCTAssertEqual(response.name, faction.name)
        XCTAssertEqual(response.isPrimary, faction.isPrimary)
    }
}
