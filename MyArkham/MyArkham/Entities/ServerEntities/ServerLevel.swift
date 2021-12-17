//
//  ServerLevel.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

struct ServerLevel: Codable {
    
    let min: Int
    let max: Int
    
    func convertToEntity() -> Level {
        
        return Level(min: min,
                     max: max)
    }
}
