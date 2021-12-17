//
//  Persistence.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import Foundation

protocol Persistence {
     
    func savePack(pack: Pack)
    
    func removePack(pack: Pack)
    
    func getPacks() -> [Pack]
    
    func saveFaction(faction: Faction)
    
    func removefaction(faction: Faction)
    
    func getFactions() -> [Faction]
    
    func saveCard(card: Card)
    
    func getCards() -> [Card]
    
    func getCardsByPack(pack: Pack) -> [Card]
    
    func getCardsByFaction(faction: Faction) -> [Card]
}
