//
//  GetFactionsUseCaseUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 21/12/21.
//

import XCTest
@testable import MyArkham

class GetFactionsUseCaseUnitTests: XCTestCase {

    var sut: GetFactionsUseCase?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetFactionsIsCalled() {
        
        // Given
        let repository = MockFactionRepository()
        sut = GetFactionsUseCase(repository: repository)
        
        // When
        _ = sut!.execute()
        
        // Then
        XCTAssertTrue(repository.isGetFactionsCalled)
    }
}
