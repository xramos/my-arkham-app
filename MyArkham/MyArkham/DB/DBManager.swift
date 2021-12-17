//
//  DBManager.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import Foundation
import CoreData

class DBManager: Persistence {
    
    // MARK: - Properties
    
    let coreDataStack: CoreDataStack
    
    // MARK: - Methods
    
    init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
        
        self.coreDataStack = coreDataStack
    }
    
    func savePack(pack: Pack) {
        
        let dbPack = DBPack(context: coreDataStack.managedContext)
        
        dbPack.id = Int64(pack.id)
        dbPack.name = pack.name
        dbPack.code = pack.code
        dbPack.available = pack.available
        dbPack.position = Int16(pack.position)
        dbPack.cyclePosition = Int16(pack.cyclePosition)
        dbPack.total = Int16(pack.total)
        
        coreDataStack.saveContext()
    }
    
    func removePack(pack: Pack) {
        
        let packId = Int64(pack.id)
        
        let fetchRequest = NSFetchRequest<DBPack>(entityName: "DBPack")
        fetchRequest.predicate = NSPredicate(format: "id==\(packId)")
        
        do {
            
            let dbPacks = try coreDataStack.managedContext.fetch(fetchRequest)
            
            for dbPack in dbPacks {
                coreDataStack.managedContext.delete(dbPack)
            }
            
            coreDataStack.saveContext()
            
        } catch let error as NSError {
            
            print("Could not fetch for delete. \(error), \(error.userInfo)")
        }
    }
    
    func getPacks() -> [Pack] {
        
        var packs: [Pack] = []
        
        let fetchRequest = NSFetchRequest<DBPack>(entityName: "DBPack")
        
        do {
            
            let dbPacks = try coreDataStack.managedContext.fetch(fetchRequest)
            
            for dbPack in dbPacks {
                let pack = dbPack.convertToEntity()
                packs.append(pack)
            }
            
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return packs
    }
    
    func saveFaction(faction: Faction) {
        
        let dbFaction = DBFaction(context: coreDataStack.managedContext)
        
        dbFaction.id = faction.id
        dbFaction.name = faction.name
        dbFaction.code = faction.code
        dbFaction.isPrimary = faction.isPrimary
        
        coreDataStack.saveContext()
    }
    
    func removefaction(faction: Faction) {
        
        let factionId = faction.id
        
        let fetchRequest = NSFetchRequest<DBFaction>(entityName: "DBFaction")
        fetchRequest.predicate = NSPredicate(format: "id==\(factionId)")
        
        do {
            
            let dbFactions = try coreDataStack.managedContext.fetch(fetchRequest)
            
            for dbFaction in dbFactions {
                coreDataStack.managedContext.delete(dbFaction)
            }
            
            coreDataStack.saveContext()
            
        } catch let error as NSError {
            
            print("Could not fetch for delete. \(error), \(error.userInfo)")
        }
    }
    
    func getFactions() -> [Faction] {
        
        var factions: [Faction] = []
        
        let fetchRequest = NSFetchRequest<DBFaction>(entityName: "DBFaction")
        
        do {
            
            let dbFactions = try coreDataStack.managedContext.fetch(fetchRequest)
            
            for dbFaction in dbFactions {
                let faction = dbFaction.convertToEntity()
                factions.append(faction)
            }
            
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return factions
    }
    
    // MARK: - Card Methods
    
    func saveCard(card: Card) {
        
        let context = coreDataStack.managedContext
        
        var dbDeckOptions: [DBDeckOption] = []
        
        if let deckOptions = card.deckOptions {
            
            for deckOption in deckOptions {

                let factions = deckOption.faction?.joined(separator: ",")
                let tr = deckOption.trait?.joined(separator: ",")
                let use = deckOption.uses?.joined(separator: ",")
                
                let dbDeckOption = DBDeckOption(context: context)
                dbDeckOption.faction = factions
                dbDeckOption.trait = tr
                dbDeckOption.uses = use
                dbDeckOption.limit = Int16(deckOption.limit ?? 0)
                dbDeckOption.not = deckOption.not ?? false
                
                if let level = deckOption.level {
                    
                    let dbLevel = DBLevel(context: context)
                    dbLevel.min = Int16(level.min)
                    dbLevel.max = Int16(level.max)
                
                    dbDeckOption.level = dbLevel
                }
                
                if let atleast = deckOption.atleast {
                    
                    let dbAtLeast = DBAtLeast(context: context)
                    dbAtLeast.factions = Int16(atleast.factions)
                    dbAtLeast.min = Int16(atleast.min)
                    
                    dbDeckOption.atleast = dbAtLeast
                }
                
                dbDeckOptions.append(dbDeckOption)
            }
        }
        
        let duplicated = card.duplicatedBy?.joined(separator: ",")
        
        let dbCard = DBCard(context: context)
        dbCard.id = card.id
        dbCard.code = card.code
        dbCard.name = card.name
        dbCard.realName = card.realName
        dbCard.subname = card.subname
        dbCard.text = card.text
        dbCard.realText = card.realText
        dbCard.packCode = card.packCode
        dbCard.packName = card.packName
        dbCard.factionCode = card.factionCode
        dbCard.factionName = card.factionName
        dbCard.typeCode = card.typeCode
        dbCard.typeName = card.typeName
        dbCard.subtypeCode = card.subtypeCode
        dbCard.subtypeName = card.subtypeName
        dbCard.position = Int64(card.position)
        dbCard.exceptional = card.exceptional
        dbCard.cost = Int16(card.cost ?? 0)
        dbCard.xp = Int16(card.xp ?? 0)
        dbCard.quantity = Int16(card.quantity)
        dbCard.skillWillpower = Int16(card.skillWillpower ?? 0)
        dbCard.skillIntelect = Int16(card.skillIntelect ?? 0)
        dbCard.skillCombat = Int16(card.skillCombat ?? 0)
        dbCard.skillAgility = Int16(card.skillAgility ?? 0)
        dbCard.skillWild = Int16(card.skillWild ?? 0)
        dbCard.healthPerInvestigator = card.healthPerInvestigator
        dbCard.health = Int16(card.health ?? 0)
        dbCard.sanity = Int16(card.sanity ?? 0)
        dbCard.deckLimit = Int16(card.deckLimit ?? 0)
        dbCard.slot = card.slot
        dbCard.realSlot = card.realSlot
        dbCard.traits = card.traits
        dbCard.realTraits = card.realTraits
        
        if dbDeckOptions.count > 0 {
            dbCard.deckOptions?.addingObjects(from: dbDeckOptions)
        }
        
        dbCard.flavor = card.flavor
        dbCard.isUnique = card.isUnique
        dbCard.permanent = card.permanent
        dbCard.doubleSided = card.doubleSided
        dbCard.backText = card.backText
        dbCard.backFlavor = card.backFlavor
        dbCard.imagesrc = card.imagesrc
        dbCard.backimagescr = card.backimagesrc
        dbCard.duplicatedBy = duplicated
        
        context.perform { [self] in
            
            self.coreDataStack.saveContext()
        }
    }
    
    func getCards() -> [Card] {
        
        var cards: [Card] = []
        
        let fetchRequest = NSFetchRequest<DBCard>(entityName: "DBCard")
        
        do {
            
            let dbCards = try coreDataStack.managedContext.fetch(fetchRequest)
            
            for dbCard in dbCards {
                let dbCard = dbCard.convertToEntity()
                cards.append(dbCard)
            }
            
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return cards
    }
    
    func getCardsByPack(pack: Pack) -> [Card] {
        
        var cards: [Card] = []
        
        let packCode = pack.code
        
        let fetchRequest = NSFetchRequest<DBCard>(entityName: "DBCard")
        fetchRequest.predicate = NSPredicate(format: "packCode == %@", packCode)
        
        do {
            
            let dbCards = try coreDataStack.managedContext.fetch(fetchRequest)
            
            for dbCard in dbCards {
                let dbCard = dbCard.convertToEntity()
                cards.append(dbCard)
            }
            
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return cards
    }
    
    func getCardsByFaction(faction: Faction) -> [Card] {
        
        var cards: [Card] = []
        
        let fCode = faction.code
        
        let fetchRequest = NSFetchRequest<DBCard>(entityName: "DBCard")
        fetchRequest.predicate = NSPredicate(format: "factionCode == %@", fCode)
        
        do {
            
            let dbCards = try coreDataStack.managedContext.fetch(fetchRequest)
            
            for dbCard in dbCards {
                let dbCard = dbCard.convertToEntity()
                cards.append(dbCard)
            }
            
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return cards
    }
}
