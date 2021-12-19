//
//  Card.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation

struct Card: Identifiable {
    
    let id: String
    let code: String
    let name: String
    let realName: String?
    let subname: String?
    let text: String?
    let realText: String?
    let packCode: String
    let packName: String
    let factionCode: String
    let factionName: String
    let typeCode: String
    let typeName: String
    let subtypeCode: String?
    let subtypeName: String?
    let position: Int
    let exceptional: Bool
    let cost: Int?
    let xp: Int?
    let quantity: Int
    let skillWillpower: Int?
    let skillIntelect: Int?
    let skillCombat: Int?
    let skillAgility: Int?
    let skillWild: Int?
    let healthPerInvestigator: Bool
    let health: Int?
    let sanity: Int?
    let deckLimit: Int?
    let slot: String?
    let realSlot: String?
    let traits: String?
    let realTraits: String?
    let deckOptions: [DeckOption]?
    let flavor: String?
    let isUnique: Bool
    let permanent: Bool
    let doubleSided: Bool
    let backText: String?
    let backFlavor: String?
    let imagesrc: String?
    let backimagesrc: String?
    let duplicatedBy: [String]?
    
    func convertToDBEntity() -> DBCard {
        
        let dbCard = DBCard(id: id,
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
                            cost: cost,
                            xp: xp,
                            quantity: quantity,
                            skillWillpower: skillWillpower,
                            skillIntelect: skillIntelect,
                            skillCombat: skillCombat,
                            skillAgility: skillAgility,
                            skillWild: skillWild,
                            healthPerInvestigator: healthPerInvestigator,
                            health: health,
                            sanity: sanity,
                            deckLimit: deckLimit,
                            slot: slot,
                            realSlot: realSlot,
                            traits: traits,
                            realTraits: realTraits,
                            flavor: flavor,
                            isUnique: isUnique,
                            permanent: permanent,
                            doubleSided: doubleSided,
                            backText: backText,
                            backFlavor: backFlavor,
                            imagesrc: imagesrc,
                            backimagesrc: backimagesrc,
                            duplicatedBy: duplicatedBy)
        
        if let deckOptions = deckOptions {
            
            for deckOption in deckOptions {
                let dbDeckOption = deckOption.convertToDBEntity()
                dbCard.deckOptions.append(dbDeckOption)
            }
        }
        
        return dbCard
    }
}
