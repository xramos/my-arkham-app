//
//  FactionDetailViewModel.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

class FactionDetailViewModel: ObservableObject {
    
    // Variables
    
    private var originalCards: [Card] = []
    public private(set) var faction: Faction
    @Published public private(set) var cards: [Card] = []
    
    // MARK: - Methods
    
    init(faction: Faction) {
        
        self.faction = faction
    }
    
    func getCards() {
        
        cards = GetCardsByFactionUseCase().execute(faction: faction)
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
