//
//  DBDeckOption.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation
import RealmSwift

class DBDeckOption: Object {
    
    @objc public dynamic var id: String = ""
    @objc public private(set) var faction: String = ""
    @objc public private(set) var trait: String = ""
    @objc public private(set) var uses: String = ""
    public private(set) var limit = RealmOptional<Int>(nil)
    public private(set) var not = RealmOptional<Bool>(nil)
    @objc dynamic var level: DBLevel?
    @objc dynamic var atleast: DBAtLeast?
    
    // MARK: - Methods
    
    public required override init() {
        super.init()
    }
    
    public override static func primaryKey() -> String? {
        
        return "id"
    }
    
    init(id: String, faction: [String]?, trait: [String]?, uses: [String]?, limit: Int?, not: Bool?, level: DBLevel?, atleast: DBAtLeast?) {
        self.id = id
        self.faction = faction?.joined(separator: ",") ?? ""
        self.trait = trait?.joined(separator: ",") ?? ""
        self.uses = uses?.joined(separator: ",") ?? ""
        self.limit.value = limit
        self.not.value = not
        self.level = level
        self.atleast = atleast
    }
    
    func convertToEntity() -> DeckOption {
        
        let factions = faction.components(separatedBy: ",")
        let tr = trait.components(separatedBy: ",")
        let use = uses.components(separatedBy: ",")
        
        return DeckOption(id: id,
                          faction: factions,
                          level: level?.convertToEntity(),
                          trait: tr,
                          uses: use,
                          limit: limit.value,
                          atleast: atleast?.convertToEntity(),
                          not: not.value)
    }
}
