//
//  DBDeckOption.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

extension DBDeckOption {
    
    func convertToEntity() -> DeckOption {
        
        let factions = faction?.components(separatedBy: ",")
        let tr = trait?.components(separatedBy: ",")
        let use = uses?.components(separatedBy: ",")
        
        return DeckOption(faction: factions ?? [],
                          level: level?.convertToEntity(),
                          trait: tr,
                          uses: use,
                          limit: Int(limit),
                          atleast: atleast?.convertToEntity(),
                          not: not)
    }
}
