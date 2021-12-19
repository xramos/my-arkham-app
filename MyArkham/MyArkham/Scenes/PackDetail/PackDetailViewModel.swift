//
//  PackDetailViewModel.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

class PackDetailViewModel: ObservableObject {
    
    // Variables
    
    private var originalCards: [Card] = []
    public private(set) var pack: Pack
    @Published public private(set) var cards: [Card] = []
    
    // MARK: - Methods
    
    init(pack: Pack) {
        
        self.pack = pack
    }
    
    func getCards() {
        
        cards = GetCardsByPackUseCase().execute(pack: pack)
        originalCards = cards
    }
    
    func sortByType(_ selection: String) {
        
        if selection == CardType.all.rawValue {
            
            self.cards = self.originalCards
            
        } else {
            
            self.cards = self.originalCards.filter { card in
                
                card.typeCode == selection
            }
        }
    }
}
