//
//  ServerDeckOptionUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 19/12/21.
//

import XCTest
@testable import MyArkham

class ServerDeckOptionUnitTests: XCTestCase {

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
        let serverDeckOption = ServerDeckOption(faction: ["guardian", "seeker"],
                                                level: nil,
                                                trait: ["trait1", "trait2"],
                                                uses: ["use1", "use2"],
                                                limit: 1,
                                                atleast: nil,
                                                not: true)
        
        // When
        let response = serverDeckOption.convertToEntity()
        
        // Then
        XCTAssertEqual(response.faction, serverDeckOption.faction)
        XCTAssertEqual(response.trait, serverDeckOption.trait)
        XCTAssertEqual(response.uses, serverDeckOption.uses)
        XCTAssertEqual(response.limit, serverDeckOption.limit)
        XCTAssertEqual(response.not, serverDeckOption.not)
    }
}
