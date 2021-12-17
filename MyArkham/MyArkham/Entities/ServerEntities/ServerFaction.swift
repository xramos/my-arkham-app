//
//  ServerFaction.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

struct ServerFaction: Codable {
    
    let code: String
    let name: String
    let isPrimary: Bool
    
    func convertToEntity() -> Faction {
        
        return Faction(id: UUID().uuidString,
                       code: code,
                       name: name,
                       isPrimary: isPrimary)
    }
}
