//
//  GetCardsByPackUseCase.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

class GetCardsByPackUseCase {
    
    private let repository: CardRepository
    
    init(repository: CardRepository = CardRepositoryImplementation()) {
        
        self.repository = repository
    }
    
    func execute(pack: Pack) -> [Card] {
        
        return repository.getCardsByPack(pack: pack)
    }
}
