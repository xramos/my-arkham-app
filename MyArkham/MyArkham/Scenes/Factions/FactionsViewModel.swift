//
//  FactionsViewModel.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation
import Combine

class FactionsViewModel: ObservableObject {
    
    // Values
    
    @Published public private(set) var factions: [Faction] = []
    @Published public private(set) var showProgressView = false
    
    private var cardCancellale: AnyCancellable?
    private var factionCancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getCards() {
        
        showProgressView = true
        
        cardCancellale = GetCardsUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.getFactions()
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (cards: [Card]) in
                
                // We don't do anything here
                print("")
            })
    }
    
    func getFactions() {
        
        factionCancellable = GetFactionsUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (factions: [Faction]) in
                
                self.factions = factions
            })
    }
}
