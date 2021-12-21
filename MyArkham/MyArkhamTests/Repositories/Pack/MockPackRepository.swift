//
//  MockPackRepository.swift
//  MyArkhamTests
//
//  Created by Xavi on 21/12/21.
//

import Foundation
import Combine
@testable import MyArkham

class MockPackRepository: PackRepository {
    
    var isGetPacksCalled = false
    
    func getPacks() -> AnyPublisher<[Pack], Error> {
        
        isGetPacksCalled = true
        
        let pack = Pack(id: "1",
                        name: "name",
                        code: "code",
                        position: 1,
                        cyclePosition: 1,
                        available: "available",
                        total: 40)
        return Just([pack])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
