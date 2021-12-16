//
//  LocalPackDataSource.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import Foundation

class LocalPackDataSource {
    
    private let dbManager: Persistence
    
    init(dbManager: Persistence = DBManager()) {
        
        self.dbManager = dbManager
    }
    
    func savePack(pack: Pack) {
        
        dbManager.savePack(pack: pack)
    }
    
    func getPacks() -> [Pack] {
        
        return dbManager.getPacks()
    }
}
