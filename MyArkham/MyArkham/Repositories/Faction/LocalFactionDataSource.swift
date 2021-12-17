//
//  LocalFactionDataSource.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

class LocalFactionDataSource {
    
    private let dbManager: Persistence
    
    init(dbManager: Persistence = DBManager()) {
        
        self.dbManager = dbManager
    }
    
    func saveFaction(faction: Faction) {
        
        dbManager.saveFaction(faction: faction)
    }
    
    func getFactions() -> [Faction] {
        
        return dbManager.getFactions()
    }
}
