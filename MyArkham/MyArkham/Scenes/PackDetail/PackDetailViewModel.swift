//
//  PackDetailViewModel.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

class PackDetailViewModel: ObservableObject {
    
    // Variables
    
    public private(set) var pack: Pack
    @Published public private(set) var cards: [Card] = []
    
    // MARK: - Methods
    
    init(pack: Pack) {
        
        self.pack = pack
    }
    
    func getCards() {
        
        cards = GetCardsByPackUseCase().execute(pack: pack)
    }
}
