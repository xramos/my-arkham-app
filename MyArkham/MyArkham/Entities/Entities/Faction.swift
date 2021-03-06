//
//  Faction.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

struct Faction: Identifiable {
    
    let id: String
    let code: String
    let name: String
    let isPrimary: Bool
    
    func convertToDBEntity() -> DBFaction {
        
        return DBFaction(id: id,
                         code: code,
                         name: name,
                         isPrimary: isPrimary)
    }
}
