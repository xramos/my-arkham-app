//
//  PacksViewModel.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import Foundation
import Combine

class PacksViewModel: ObservableObject {
    
    // Values
    
    @Published public private(set) var packs: [Pack] = []
    @Published public private(set) var showProgressView = false
    
    private var cardCancellable: AnyCancellable?
    private var packCancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getCards() {
        
        showProgressView = true
        
        cardCancellable = GetCardsUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.getPacks()
                
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
    
    func getPacks() {
        
        packCancellable = GetPacksUseCase().execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: { (packs: [Pack]) in
                
                self.packs = packs
            })
    }
}
