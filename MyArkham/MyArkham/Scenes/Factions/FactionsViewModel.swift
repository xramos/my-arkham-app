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
    
    private var cancellable: AnyCancellable?
    
    // MARK: - Methods
    
    func getFactions() {
        
        showProgressView = true
        
        cancellable = GetFactionsUseCase().execute()
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
