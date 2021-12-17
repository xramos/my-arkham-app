//
//  GetFactionsUseCase.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation
import Combine

class GetFactionsUseCase {
    
    private let repository: FactionRepository
    
    init(repository: FactionRepository = FactionRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> AnyPublisher<[Faction], Error> {
        
        return repository.getFactions()
    }
}
