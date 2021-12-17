//
//  ServerAtLeast.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

struct ServerAtLeast: Codable {
    
    let factions: Int
    let min: Int
    
    func convertToEntity() -> AtLeast {
        
        return AtLeast(factions: factions,
                       min: min)
    }
}
