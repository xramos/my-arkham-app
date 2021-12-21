//
//  DBManagerUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 21/12/21.
//

import XCTest
@testable import MyArkham

class DBManagerUnitTests: XCTestCase {

    var sut: DBManager!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = DBManager(storageType: .inMemory(identifier: "test"))
        sut.configureDB()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testSavePack() {
     
        // Given
        let pack = Pack(id: "1",
                        name: "name",
                        code: "code",
                        position: 1,
                        cyclePosition: 1,
                        available: "available",
                        total: 40)
        
        // When
        sut.savePack(pack: pack)
        let response = sut.getPacks()
        
        // Then
        XCTAssertEqual(response.count, 1)
    }
    
    func testRemovePack() {
        
        // Given
        let pack = Pack(id: "1",
                        name: "name",
                        code: "code",
                        position: 1,
                        cyclePosition: 1,
                        available: "available",
                        total: 40)
        
        // When
        sut.savePack(pack: pack)
        sut.removePack(pack: pack)
        let response = sut.getPacks()
        
        // Then
        XCTAssertEqual(response.count, 0)
    }
    
    func testSaveFaction() {
        
        // Given
        let faction = Faction(id: "1",
                              code: "code",
                              name: "name",
                              isPrimary: true)
        
        // When
        sut.saveFaction(faction: faction)
        let response = sut.getFactions()
        
        // Then
        XCTAssertEqual(response.count, 1)
    }
    
    func testRemoveFaction() {
        
        // Given
        let faction = Faction(id: "1",
                              code: "code",
                              name: "name",
                              isPrimary: true)
          
        // When
        sut.saveFaction(faction: faction)
        sut.removefaction(faction: faction)
        let response = sut.getFactions()
        
        // Then
        XCTAssertEqual(response.count, 0)
    }
}
