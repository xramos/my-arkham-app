//
//  Level.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

struct Level {
    
    let id: String
    let min: Int
    let max: Int
    
    func convertToDBEntity() -> DBLevel {
        
        return DBLevel(id: id,
                       min: min,
                       max: max)
    }
}
