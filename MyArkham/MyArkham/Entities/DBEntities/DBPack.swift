//
//  DbPack.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import Foundation
import RealmSwift

class DBPack: Object {
    
    @objc public dynamic var id: String = ""
    @objc public private(set) dynamic var name: String = ""
    @objc public private(set) dynamic var code: String = ""
    @objc public private(set) dynamic var position: Int = 0
    @objc public private(set) dynamic var cyclePosition: Int = 0
    @objc public private(set) dynamic var available: String = ""
    @objc public private(set) dynamic var total: Int = 0
    
    // MARK: - Methods
    
    public required override init() {
        super.init()
    }
    
    public override static func primaryKey() -> String? {
        
        return "id"
    }
    
    init(id: String, name: String, code: String, position: Int, cyclePosition: Int, available: String, total: Int) {
        self.id = id
        self.name = name
        self.code = code
        self.position = position
        self.cyclePosition = cyclePosition
        self.available = available
        self.total = total
    }
    
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
