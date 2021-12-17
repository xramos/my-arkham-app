//
//  GetAllCardsUseCase.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

class GetAllCardsUseCase {
    
    private let repository: CardRepository
    
    init(repository: CardRepository = CardRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute() -> [Card] {
        
        return repository.getAllCards()
    }
}
