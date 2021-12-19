//
//  DeckOptions.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

struct DeckOption {
    
    let id: String
    let faction: [String]?
    let level: Level?
    let trait: [String]?
    let uses: [String]?
    let limit: Int?
    let atleast: AtLeast?
    let not: Bool?
    
    func convertToDBEntity() -> DBDeckOption {
        
        return DBDeckOption(id: id,
                            faction: faction,
                            trait: trait,
                            uses: uses,
                            limit: limit,
                            not: not,
                            level: level?.convertToDBEntity(),
                            atleast: atleast?.convertToDBEntity())
    }
}
