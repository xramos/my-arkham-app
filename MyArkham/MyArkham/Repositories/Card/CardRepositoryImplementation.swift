//
//  CardRepositoryImplementation.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation
import Combine

class CardRepositoryImplementation: CardRepository {
    
    private let remoteDataSource: RemoteCardDataSource
    private let localDataSource: LocalCardDataSource
    
    init(remoteDataSource: RemoteCardDataSource = RemoteCardDataSource(),
         localDataSource: LocalCardDataSource = LocalCardDataSource()) {
        
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getCards() -> AnyPublisher<[Card], Error> {
        
        if remoteDataSource.isGetCardsCacheAvailable() {
            
            // Get cards from DDBB
            let cards = localDataSource.getCards()
            
            return Result.Publisher(cards).eraseToAnyPublisher()
            
        } else {
            
            // Make network call
            return remoteDataSource.getCards().map { serverCards -> [Card] in
                
                var cards: [Card] = []
                
                // Convert soaentities to entities and save to Core Data
                for serverCard in serverCards {
                    
                    let card = serverCard.convertToEntity()
                    
                    self.localDataSource.saveCard(card: card)
                    
                    cards.append(card)
                }
                
                // Save Cache
                self.remoteDataSource.addGetCardsCache()
                
                // Return entities
                return cards
            }
            .mapError({ $0 })
            .eraseToAnyPublisher()
        }
    }
    
    func getAllCards() -> [Card] {
        
        return localDataSource.getCards()
    }
    
    func getCardsByPack(pack: Pack) -> [Card] {
        
        return localDataSource.getCardsByPack(pack: pack)
    }
    
    func getCardsByFaction(faction: Faction) -> [Card] {
        
        return localDataSource.getCardsByFaction(faction: faction)
    }
}
