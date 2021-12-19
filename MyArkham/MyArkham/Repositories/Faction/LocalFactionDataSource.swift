//
//  LocalFactionDataSource.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

class LocalFactionDataSource {
    
    private let dbManager: DBManager
    
    init(dbManager: DBManager = DBManager()) {
        
        self.dbManager = dbManager
        self.dbManager.configureDB()
    }
    
    func saveFaction(faction: Faction) {
        
        dbManager.saveFaction(faction: faction)
    }
    
    func getFactions() -> [Faction] {
        
        return dbManager.getFactions()
    }
}
