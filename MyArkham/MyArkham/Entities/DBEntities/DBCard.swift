//
//  DBCard.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

extension DBCard {
    
    func convertToEntity() -> Card {
        
        let duplicated = duplicatedBy?.components(separatedBy: ",")
        
        var deckOps: [DeckOption] = []
        
        if let deckOptions = deckOptions {
            
            for deckOption in deckOptions {
                
                let deckOp = (deckOption as! DBDeckOption).convertToEntity()
                deckOps.append(deckOp)
            }
        }
        
        return Card(id: id ?? "",
                    code: code ?? "",
                    name: name ?? "",
                    realName: realName ?? "",
                    subname: subname,
                    text: text ?? "",
                    realText: realText ?? "",
                    packCode: packCode ?? "",
                    packName: packName ?? "",
                    factionCode: factionCode ?? "",
                    factionName: factionName ?? "",
                    typeCode: typeCode ?? "",
                    typeName: typeName ?? "",
                    subtypeCode: subtypeCode,
                    subtypeName: subtypeName,
                    position: Int(position),
                    exceptional: exceptional,
                    cost: Int(cost),
                    xp: Int(xp),
                    quantity: Int(quantity),
                    skillWillpower: Int(skillWillpower),
                    skillIntelect: Int(skillIntelect),
                    skillCombat: Int(skillCombat),
                    skillAgility: Int(skillAgility),
                    skillWild: Int(skillWild),
                    healthPerInvestigator: healthPerInvestigator,
                    health: Int(health),
                    sanity: Int(sanity),
                    deckLimit: Int(deckLimit),
                    slot: slot,
                    realSlot: realSlot ?? "",
                    traits: traits ?? "",
                    realTraits: realTraits ?? "",
                    deckOptions: deckOps,
                    flavor: flavor,
                    isUnique: isUnique,
                    permanent: permanent,
                    doubleSided: doubleSided,
                    backText: backText,
                    backFlavor: backFlavor,
                    imagesrc: imagesrc,
                    backimagesrc: backimagescr,
                    duplicatedBy: duplicated)
    }
}
