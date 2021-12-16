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
        let dbPack = DBPack(context: TestCoreDataStack().managedContext)
        
        dbPack.id = Int64(1)
        dbPack.name = "name"
        dbPack.code = "code"
        dbPack.available = "available"
        dbPack.position = Int16(1)
        dbPack.cyclePosition = Int16(1)
        dbPack.total = Int16(40)
        
        // When
        let pack = dbPack.convertToEntity()
        
        // Then
        XCTAssertNotNil(pack)
        XCTAssertEqual(dbPack.id, Int64(pack.id))
        XCTAssertEqual(dbPack.name, pack.name)
        XCTAssertEqual(dbPack.code, pack.code)
        XCTAssertEqual(dbPack.available, pack.available)
        XCTAssertEqual(dbPack.position, Int16(pack.position))
        XCTAssertEqual(dbPack.cyclePosition, Int16(pack.cyclePosition))
        XCTAssertEqual(dbPack.total, Int16(pack.total))
    }
}
