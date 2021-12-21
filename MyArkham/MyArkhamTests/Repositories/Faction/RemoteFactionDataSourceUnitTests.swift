//
//  RemoteFactionDataSourceUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 21/12/21.
//

import XCTest
@testable import MyArkham

class RemoteFactionDataSourceUnitTests: XCTestCase {

    var sut: RemoteFactionDataSource?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        sut = RemoteFactionDataSource(baseURL: "http://jsonplaceholder.typicode.com/")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetFactionsEndpoint() {
        
        // When
        let response = sut!.getFactionsEndpoint()
        
        // Then
        XCTAssertNotNil(response)
        XCTAssertEqual(response.url?.absoluteString, "http://jsonplaceholder.typicode.com/factions")
    }
}
