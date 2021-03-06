//
//  LocalCardDataSource.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

class LocalCardDataSource {
    
    private let dbManager: DBManager
    
    init(dbManager: DBManager = DBManager()) {
        
        self.dbManager = dbManager
        dbManager.configureDB()
    }
    
    func saveCard(card: Card) {
        
        return dbManager.saveCard(card: card)
    }
    
    func getCards() -> [Card] {
        
        return dbManager.getCards()
    }
    
    func getCardsByPack(pack: Pack) -> [Card] {
        
        return dbManager.getCardsByPack(pack: pack)
    }
    
    func getCardsByFaction(faction: Faction) -> [Card] {
        
        return dbManager.getCardsByFaction(faction: faction)
    }
}
