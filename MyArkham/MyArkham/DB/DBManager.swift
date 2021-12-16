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
}
