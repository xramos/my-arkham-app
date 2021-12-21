//
//  GetPacksUseCaseUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 21/12/21.
//

import XCTest
@testable import MyArkham

class GetPacksUseCaseUnitTests: XCTestCase {

    var sut: GetPacksUseCase?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }

    func testGetPacksUseCase() {
        
        // Given
        let repository = MockPackRepository()
        sut = GetPacksUseCase(repository: repository)
        
        // When
        _ = sut!.execute()
        
        // Then
        XCTAssertTrue(repository.isGetPacksCalled)
    }
}
