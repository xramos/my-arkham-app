//
//  FactionRepositoryImplementationUnitTests.swift
//  MyArkhamTests
//
//  Created by Xavi on 21/12/21.
//

import XCTest
import Combine
@testable import MyArkham

class FactionRepositoryImplementationUnitTests: XCTestCase {

    var sut: FactionRepositoryImplementation?
    var cancellable: AnyCancellable?
    
    let baseUrlString = "http://jsonplaceholder.typicode.com/"
    
    let successStatusCode = 200
    let failureStatusCode = 401
    let timeoutTime: TimeInterval = 2
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        
        try super.tearDownWithError()
    }
    
    func testGetFactionsOK() {
        
    }

    func testGetFactionsError() {
     
        // Given
        let session = getFactionsSession(statusCode: failureStatusCode)
        
        let remote = RemoteFactionDataSource(baseURL: baseUrlString, session: session)
        
        sut = FactionRepositoryImplementation(remoteDataSource: remote)
        
        let exp = expectation(description: "expected values")
        
        // When
        cancellable = sut!.getFactions()
            .sink(receiveCompletion: { completion in
                
                switch completion {
                case .finished:
                    break
                case.failure:
                    exp.fulfill()
                }
            }, receiveValue: { factions in
                
                // Nothing to do
            })
        
        wait(for: [exp], timeout: timeoutTime)
        
        // Then
        XCTAssertNotNil(cancellable)
    }
}

extension FactionRepositoryImplementationUnitTests {

    func getFactionsSession(statusCode: Int) -> URLSession {
        
        // URL we expect to call
        let url = URL(string: "http://jsonplaceholder.typicode.com/factions")
        
        // data we expect to recieve
        let data = getFactionsData()
        
        // attach that to some fixed data in our protocol handler
        URLProtocolMock.testURLs = [url: data]
        URLProtocolMock.response = HTTPURLResponse(url: URL(string: "http://jsonplaceholder.typicode.com:8080")!,
                                                   statusCode: statusCode,
                                                   httpVersion: nil,
                                                   headerFields: nil)
        
        // noew setup a configuration to use our mock
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        
        // and create the URLSession from that
        let session = URLSession(configuration: config)
        
        return session
    }
    
    func getFactionsData() -> Data {

        let dataString = """
        {
        
        }
        """
        
        return Data(dataString.utf8)
    }
}
