//
//  DBFactionUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 21/12/21.
//

import XCTest
@testable import MyArkham

class DBFactionUnitTests: XCTestCase {

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
        let dbFaction = DBFaction(id: "1",
                                  code: "code",
                                  name: "name",
                                  isPrimary: true)
        
        // When
        let response = dbFaction.convertToEntity()
        
        // Then
        XCTAssertEqual(response.id, dbFaction.id)
        XCTAssertEqual(response.code, dbFaction.code)
        XCTAssertEqual(response.name, dbFaction.name)
        XCTAssertEqual(response.isPrimary, dbFaction.isPrimary)
    }
}
