//
//  DBAtLeast.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

extension DBAtLeast {
    
    func convertToEntity() -> AtLeast {
        
        return AtLeast(factions: Int(factions),
                       min: Int(min))
    }
}
