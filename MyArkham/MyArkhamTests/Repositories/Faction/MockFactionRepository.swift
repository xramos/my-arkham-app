//
//  MockFactionRepository.swift
//  MyArkhamTests
//
//  Created by Xavi on 21/12/21.
//

import Foundation
import Combine
@testable import MyArkham

class MockFactionRepository: FactionRepository {
    
    var isGetFactionsCalled = false
    
    func getFactions() -> AnyPublisher<[Faction], Error> {
        
        isGetFactionsCalled = true
        
        let faction = Faction(id: "1", code: "code", name: "name", isPrimary: true)
        return Just([faction])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
