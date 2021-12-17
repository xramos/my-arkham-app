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
}
