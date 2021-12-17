//
//  CardRepository.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation
import Combine

protocol CardRepository {
    
    func getCards() -> AnyPublisher<[Card], Error>
    func getCardsByPack(pack: Pack) -> [Card]
    func getCardsByFaction(faction: Faction) -> [Card]
}
