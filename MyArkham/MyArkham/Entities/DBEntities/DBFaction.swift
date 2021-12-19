//
//  DBFaction.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation
import RealmSwift

class DBFaction: Object {
    
    @objc public dynamic var id: String = ""
    @objc public private(set) dynamic var code: String = ""
    @objc public private(set) dynamic var name: String = ""
    @objc public private(set) dynamic var isPrimary: Bool = false
    
    // MARK: - Methods
    
    public required override init() {
        super.init()
    }
    
    public override static func primaryKey() -> String? {
        
        return "id"
    }
    
    init(id: String, code: String, name: String, isPrimary: Bool) {
        self.id = id
        self.code = code
        self.name = name
        self.isPrimary = isPrimary
    }
    
    func convertToEntity() -> Faction {
        
        return Faction(id: id,
                       code: code,
                       name: name,
                       isPrimary: isPrimary)
    }
}
