//
//  DBPackUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 16/12/21.
//

import XCTest
@testable import MyArkham

class DBPackUnitTests: XCTestCase {

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
        let dbPack = DBPack(id: "1",
                            name: "name",
                            code: "code",
                            position: 1,
                            cyclePosition: 1,
                            available: "available",
                            total: 40)
        
        // When
        let pack = dbPack.convertToEntity()
        
        // Then
        XCTAssertNotNil(pack)
        XCTAssertEqual(dbPack.id, pack.id)
        XCTAssertEqual(dbPack.name, pack.name)
        XCTAssertEqual(dbPack.code, pack.code)
        XCTAssertEqual(dbPack.available, pack.available)
        XCTAssertEqual(dbPack.position, pack.position)
        XCTAssertEqual(dbPack.cyclePosition, pack.cyclePosition)
        XCTAssertEqual(dbPack.total, pack.total)
    }
}
