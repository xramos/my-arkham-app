//
//  DBLevel.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

extension DBLevel {
    
    func convertToEntity() -> Level {
        
        return Level(min: Int(min),
                     max: Int(max))
    }
}
