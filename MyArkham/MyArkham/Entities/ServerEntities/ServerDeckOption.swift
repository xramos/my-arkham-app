//
//  ServerDeckOption.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

struct ServerDeckOption: Codable {
    
    let faction: [String]?
    let level: ServerLevel?
    let trait: [String]?
    let uses: [String]?
    let limit: Int?
    let atleast: ServerAtLeast?
    let not: Bool?
    
    func convertToEntity() -> DeckOption {
        
        return DeckOption(id: UUID().uuidString,
                          faction: faction,
                          level: level?.convertToEntity(),
                          trait: trait,
                          uses: uses,
                          limit: limit,
                          atleast: atleast?.convertToEntity(),
                          not: not)
    }
}
