//
//  ServerPackUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 16/12/21.
//

import XCTest
@testable import MyArkham

class ServerPackUnitTests: XCTestCase {

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
        let serverPack = ServerPack(id: 1,
                                    name: "name",
                                    code: "code",
                                    position: 1,
                                    cyclePosition: 1,
                                    available: "available",
                                    total: 40)
        
        // When
        let pack = serverPack.convertToEntity()
        
        // Then
        XCTAssertEqual(pack.id, serverPack.id)
        XCTAssertEqual(pack.name, serverPack.name)
        XCTAssertEqual(pack.code, serverPack.code)
        XCTAssertEqual(pack.position, serverPack.position)
        XCTAssertEqual(pack.cyclePosition, serverPack.cyclePosition)
        XCTAssertEqual(pack.available, serverPack.available)
        XCTAssertEqual(pack.total, serverPack.total)
    }
}
