//
//  ServerFactionUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 19/12/21.
//

import XCTest
@testable import MyArkham

class ServerFactionUnitTests: XCTestCase {

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
        let serverFaction = ServerFaction(code: "code",
                                          name: "name",
                                          isPrimary: true)
        
        // When
        let response = serverFaction.convertToEntity()
        
        // Then
        XCTAssertEqual(response.code, serverFaction.code)
        XCTAssertEqual(response.name, serverFaction.name)
        XCTAssertEqual(response.isPrimary, serverFaction.isPrimary)
    }
}
