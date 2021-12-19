//
//  Pack.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import Foundation

struct Pack: Identifiable {
    
    let id: String
    let name: String
    let code: String
    let position: Int
    let cyclePosition: Int
    let available: String
    let total: Int
    
    func convertToDBEntity() -> DBPack {
        
        return DBPack(id: id,
                      name: name,
                      code: code,
                      position: position,
                      cyclePosition: cyclePosition,
                      available: available,
                      total: total)
    }
}
