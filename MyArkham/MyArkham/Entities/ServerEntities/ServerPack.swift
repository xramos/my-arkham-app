//
//  ServerPack.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import Foundation
import UIKit

struct ServerPack: Codable {
    
    let id: Int
    let name: String
    let code: String
    let position: Int
    let cyclePosition: Int
    let available: String
    let total: Int
    
    func convertToEntity() -> Pack {
        
        return Pack(id: id,
                    name: name,
                    code: code,
                    position: position,
                    cyclePosition: cyclePosition,
                    available: available,
                    total: total)
    }
}
