//
//  DBFaction.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

extension DBFaction {
    
    func convertToEntity() -> Faction {
        
        return Faction(id: id ?? "",
                       code: code ?? "",
                       name: name ?? "",
                       isPrimary: isPrimary)
    }
}
