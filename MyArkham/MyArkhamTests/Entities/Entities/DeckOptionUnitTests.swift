//
//  DeckOptionUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 19/12/21.
//

import XCTest
@testable import MyArkham

class DeckOptionUnitTests: XCTestCase {

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
        let deckOption = DeckOption(id: "1",
                                    faction: ["guardian", "seeker"],
                                    level: nil,
                                    trait: ["trait1", "trait2"],
                                    uses: ["use1", "use2"],
                                    limit: 1,
                                    atleast: nil,
                                    not: false)
        
        // When
        let response = deckOption.convertToDBEntity()
        
        // Then
        XCTAssertEqual(response.id, deckOption.id)
        XCTAssertEqual(response.faction, deckOption.faction?.joined(separator: ","))
        XCTAssertEqual(response.trait, deckOption.trait?.joined(separator: ","))
        XCTAssertEqual(response.uses, deckOption.uses?.joined(separator: ","))
        XCTAssertEqual(response.limit.value, deckOption.limit)
        XCTAssertEqual(response.not.value, deckOption.not)
    }
}
