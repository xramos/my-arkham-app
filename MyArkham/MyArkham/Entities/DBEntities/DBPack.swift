//
//  DbPack.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import Foundation

extension DBPack {
    
    func convertToEntity() -> Pack {
        
        return Pack(id: Int(id),
                    name: name ?? "",
                    code: code ?? "",
                    position: Int(position),
                    cyclePosition: Int(cyclePosition),
                    available: available ?? "",
                    total: Int(total))
    }
}
