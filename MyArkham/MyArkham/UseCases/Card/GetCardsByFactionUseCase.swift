//
//  GetCardsByFactionUseCase.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

class GetCardsByFactionUseCase {
    
    private let repository: CardRepository
    
    init(repository: CardRepository = CardRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(faction: Faction) -> [Card] {
        
        return repository.getCardsByFaction(faction: faction)
    }
}
