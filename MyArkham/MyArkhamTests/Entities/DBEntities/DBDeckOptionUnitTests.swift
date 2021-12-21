//
//  DBDeckOptionUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 21/12/21.
//

import XCTest
@testable import MyArkham

class DBDeckOptionUnitTests: XCTestCase {

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
        let dbDeckOption = DBDeckOption(id: "1",
                                        faction: ["faction1", "faction2"],
                                        trait: ["trait1", "trait2"],
                                        uses: ["use1", "use2"],
                                        limit: 1,
                                        not: false,
                                        level: nil,
                                        atleast: nil)
        
        // When
        let response = dbDeckOption.convertToEntity()
        
        // Then
        XCTAssertEqual(response.id, dbDeckOption.id)
        XCTAssertEqual(response.faction?.joined(separator: ",") ?? "", dbDeckOption.faction)
        XCTAssertEqual(response.trait?.joined(separator: ",") ?? "", dbDeckOption.trait)
        XCTAssertEqual(response.uses?.joined(separator: ",") ?? "", dbDeckOption.uses)
        XCTAssertEqual(response.limit, dbDeckOption.limit.value)
        XCTAssertEqual(response.not, dbDeckOption.not.value)
    }
}
