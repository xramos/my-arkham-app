//
//  DBAtLeast.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation
import RealmSwift

class DBAtLeast: Object {
    
    @objc public dynamic var id: String = ""
    @objc public private(set) dynamic var factions: Int = 0
    @objc public private(set) dynamic var min: Int = 0
    
    // MARK: - Methods
    
    public required override init() {
        super.init()
    }
    
    public override static func primaryKey() -> String? {
        
        return "id"
    }
    
    init(id: String, factions: Int, min: Int) {
        self.id = id
        self.factions = factions
        self.min = min
    }
    
    func convertToEntity() -> AtLeast {
        
        return AtLeast(id: id,
                       factions: factions,
                       min: min)
    }
}
