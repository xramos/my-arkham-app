//
//  Persistence.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import Foundation

protocol Persistence {
     
    func savePack(pack: Pack)
    
    func removePack(pack: Pack)
    
    func getPacks() -> [Pack]
}
