//
//  AtLeast.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

struct AtLeast {
    
    let id: String
    let factions: Int
    let min: Int
    
    func convertToDBEntity() -> DBAtLeast {
        
        return DBAtLeast(id: id,
                         factions: factions,
                         min: min)
    }
}
