//
//  DBLevel.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation
import RealmSwift

class DBLevel: Object {
    
    @objc public dynamic var id: String = ""
    @objc public private(set) dynamic var min: Int = 0
    @objc public private(set) dynamic var max: Int = 0
    
    // MARK: - Methods
    
    public required override init() {
        super.init()
    }
    
    public override static func primaryKey() -> String? {
        
        return "id"
    }
    
    init(id: String, min: Int, max: Int) {
        self.id = id
        self.min = min
        self.max = max
    }
    
    func convertToEntity() -> Level {
        
        return Level(id: id,
                     min: min,
                     max: max)
    }
}
