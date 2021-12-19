//
//  DBCard.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation
import RealmSwift

class DBCard: Object {
    
    @objc public dynamic var id: String = ""
    @objc public private(set) var code: String = ""
    @objc public private(set) var name: String = ""
    @objc public private(set) var realName: String = ""
    @objc public private(set) var subname: String = ""
    @objc public private(set) var text: String = ""
    @objc public private(set) var realText: String = ""
    @objc public private(set) var packCode: String = ""
    @objc public private(set) var packName: String = ""
    @objc public private(set) var factionCode: String = ""
    @objc public private(set) var factionName: String = ""
    @objc public private(set) var typeCode: String = ""
    @objc public private(set) var typeName: String = ""
    @objc public private(set) var subtypeCode: String = ""
    @objc public private(set) var subtypeName: String = ""
    @objc public private(set) var position: Int = 0
    @objc public private(set) var exceptional: Bool = false
    public private(set) var cost = RealmOptional<Int>(nil)
    public private(set) var xp = RealmOptional<Int>(nil)
    @objc public private(set) var quantity: Int = 0
    public private(set) var skillWillpower = RealmOptional<Int>(nil)
    public private(set) var skillIntelect = RealmOptional<Int>(nil)
    public private(set) var skillCombat = RealmOptional<Int>(nil)
    public private(set) var skillAgility = RealmOptional<Int>(nil)
    public private(set) var skillWild = RealmOptional<Int>(nil)
    @objc public private(set) var healthPerInvestigator: Bool = false
    public private(set) var health = RealmOptional<Int>(nil)
    public private(set) var sanity = RealmOptional<Int>(nil)
    public private(set) var deckLimit = RealmOptional<Int>(nil)
    public private(set) var slot: String = ""
    public private(set) var realSlot: String = ""
    public private(set) var traits: String = ""
    public private(set) var realTraits: String = ""
    public private(set) var flavor: String = ""
    @objc public private(set) var isUnique: Bool = false
    @objc public private(set) var permanent: Bool = false
    @objc public private(set) var doubleSided: Bool = false
    public private(set) var backText: String = ""
    public private(set) var backFlavor: String = ""
    public private(set) var imagesrc: String = ""
    public private(set) var backimagesrc: String = ""
    public private(set) var duplicatedBy: String = ""
    
    public var deckOptions = List<DBDeckOption>()
    
    // MARK: - Methods
    
    public required override init() {
        super.init()
    }
    
    public override static func primaryKey() -> String? {
        
        return "id"
    }
    
    init(id: String, code: String, name: String, realName: String?, subname: String?, text: String?, realText: String?, packCode: String, packName: String, factionCode: String, factionName: String, typeCode: String, typeName: String, subtypeCode: String?, subtypeName: String?, position: Int, exceptional: Bool, cost: Int?, xp: Int?, quantity: Int, skillWillpower: Int?, skillIntelect: Int?, skillCombat: Int?, skillAgility: Int?, skillWild: Int?, healthPerInvestigator: Bool, health: Int?, sanity: Int?, deckLimit: Int?, slot: String?, realSlot: String?, traits: String?, realTraits: String?, flavor: String?, isUnique: Bool, permanent: Bool, doubleSided: Bool, backText: String?, backFlavor: String?, imagesrc: String?, backimagesrc: String?, duplicatedBy: [String]?) {
        self.id = id
        self.code = code
        self.name = name
        self.realName = realName ?? ""
        self.subname = subname ?? ""
        self.text = text ?? ""
        self.realText = realText ?? ""
        self.packCode = packCode
        self.packName = packName
        self.factionCode = factionCode
        self.factionName = factionName
        self.typeCode = typeCode
        self.typeName = typeName
        self.subtypeCode = subtypeCode ?? ""
        self.subtypeName = subtypeName ?? ""
        self.position = position
        self.exceptional = exceptional
        self.cost.value = cost
        self.xp.value = xp
        self.quantity = quantity
        self.skillWillpower.value = skillWillpower
        self.skillIntelect.value = skillIntelect
        self.skillCombat.value = skillCombat
        self.skillAgility.value = skillAgility
        self.skillWild.value = skillWild
        self.healthPerInvestigator = healthPerInvestigator
        self.health.value = health
        self.sanity.value = sanity
        self.deckLimit.value = deckLimit
        self.slot = slot ?? ""
        self.realSlot = realSlot ?? ""
        self.traits = traits ?? ""
        self.realTraits = realTraits ?? ""
        self.flavor = flavor ?? ""
        self.isUnique = isUnique
        self.permanent = permanent
        self.doubleSided = doubleSided
        self.backText = backText ?? ""
        self.backFlavor = backFlavor ?? ""
        self.imagesrc = imagesrc ?? ""
        self.backimagesrc = backimagesrc ?? ""
        self.duplicatedBy = duplicatedBy?.joined(separator: "") ?? ""
    }
    
    func convertToEntity() -> Card {
        
        let duplicated = duplicatedBy.components(separatedBy: ",")
        
        var deckOptionsList = [DeckOption]()
        deckOptionsList.append(contentsOf: deckOptions.map({$0.convertToEntity()}))
        
        return Card(id: id,
                    code: code,
                    name: name,
                    realName: realName,
                    subname: subname,
                    text: text,
                    realText: realText,
                    packCode: packCode,
                    packName: packName,
                    factionCode: factionCode,
                    factionName: factionName,
                    typeCode: typeCode,
                    typeName: typeName,
                    subtypeCode: subtypeCode,
                    subtypeName: subtypeName,
                    position: position,
                    exceptional: exceptional,
                    cost: cost.value,
                    xp: xp.value,
                    quantity: quantity,
                    skillWillpower: skillWillpower.value,
                    skillIntelect: skillIntelect.value,
                    skillCombat: skillCombat.value,
                    skillAgility: skillAgility.value,
                    skillWild: skillWild.value,
                    healthPerInvestigator: healthPerInvestigator,
                    health: health.value,
                    sanity: sanity.value,
                    deckLimit: deckLimit.value,
                    slot: slot,
                    realSlot: realSlot,
                    traits: traits,
                    realTraits: realTraits,
                    deckOptions: deckOptionsList,
                    flavor: flavor,
                    isUnique: isUnique,
                    permanent: permanent,
                    doubleSided: doubleSided,
                    backText: backText,
                    backFlavor: backFlavor,
                    imagesrc: imagesrc,
                    backimagesrc: backimagesrc,
                    duplicatedBy: duplicated)
    }
}
