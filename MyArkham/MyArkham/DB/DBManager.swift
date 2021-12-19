//
//  DBManager.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import Foundation
import Security
import RealmSwift
import CryptoKit

class DBManager: Persistence {
    
    // MARK: - Properties
    
    private var storageType: StorageType = .inStorage
    private let keychainIdentifierString: String
    
    private var configuration: Realm.Configuration!
    private var realmMainThread: Realm!
    private var realm: Realm {
        // Distinc mainThreadRealm or create new ones
        if Thread.isMainThread {
            if let realm = realmMainThread {
                return realm
            } else {
                realmMainThread = createRealm()
                return realmMainThread
            }
        } else {
            return createRealm()
        }
    }
    
    // MARK: - Methods
    
    public init(storageType: StorageType = .inStorage) {
        
        self.storageType = storageType
        self.keychainIdentifierString = "xramos.MyArkham.realm"
    }
    
    public func configureDB() {
        
        switch storageType {
        case .inStorage:
            createConfiguration()
        case .inMemory(let identifier):
            createMemoryConfiguration(identifier: identifier)
        }
    }
    
    public class func removeDatabase() {
        
        guard let urlDocumentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("RealmManager: Document path not found")
        }
        
        do {
            
            // Delete Realm DB in Documents
            let realmInDocuments = urlDocumentsPath.appendingPathComponent("default.realm")
            if FileManager.default.fileExists(atPath: realmInDocuments.path) {
                try FileManager.default.removeItem(at: realmInDocuments)
                print("RealmManager: Realm Database FOUND in \(realmInDocuments.path) - Removed!")
            } else {
                print("RealmManager: Realm Database not found in \(realmInDocuments.path)")
            }
            
            let realmLockInDocuments = urlDocumentsPath.appendingPathComponent("default.realm.lock")
            if FileManager.default.fileExists(atPath: realmLockInDocuments.path) {
                try FileManager.default.removeItem(at: realmLockInDocuments)
                print("RealmManager: Realm Database lock FOUND in \(realmLockInDocuments.path) - Removed!")
            } else {
                print("RealmManager: Realm Database lock not found in \(realmLockInDocuments.path)")
            }
            
            // Delete Realm DB in Realm dir
            let urlRealmDirectory = urlDocumentsPath.appendingPathComponent("Realm")
            
            if FileManager.default.fileExists(atPath: urlRealmDirectory.path) {
                try FileManager.default.removeItem(at: urlRealmDirectory)
                print("RealmManager: Realm Database FOUND in \(urlRealmDirectory.path) - Removed!")
            } else {
                print("RealmManager: Realm Database not found in \(urlRealmDirectory.path)")
            }
        } catch {
            fatalError("RealmManager: Failed to remove the database. Error: \(error)")
        }
    }
    
    // MARK: - Pack Methods
    
    func savePack(pack: Pack) {
        
        let dbPack = DBPack(id: pack.id,
                            name: pack.name,
                            code: pack.code,
                            position: pack.position,
                            cyclePosition: pack.cyclePosition,
                            available: pack.available,
                            total: pack.total)
        
        _ = save(dbPack)
    }
    
    func removePack(pack: Pack) {
        
        let dbPack = pack.convertToDBEntity()
        
        _ = remove(dbPack)
    }
    
    func getPacks() -> [Pack] {
        
        var packs = [Pack]()
        for result in realm.objects(DBPack.self).sorted(byKeyPath: "available", ascending: true) {
            let pack = result.convertToEntity()
            packs.append(pack)
        }
        
        return packs
    }
    
    // MARK: - Faction Methods
    
    func saveFaction(faction: Faction) {
        
        let dbFaction = DBFaction(id: faction.id,
                                  code: faction.code,
                                  name: faction.name,
                                  isPrimary: faction.isPrimary)
        
        _ = save(dbFaction)
    }
    
    func removefaction(faction: Faction) {
        
        let dbFaction = faction.convertToDBEntity()
        
        _ = remove(dbFaction)
    }
    
    func getFactions() -> [Faction] {
        
        var factions: [Faction] = []
        for result in realm.objects(DBFaction.self).sorted(byKeyPath: "name", ascending: true) {
            let faction = result.convertToEntity()
            factions.append(faction)
        }
        
        return factions
    }
    
    // MARK: - Card Methods
    
    func saveCard(card: Card) {
        
        let dbCard = card.convertToDBEntity()
        
        _ = save(dbCard)
    }
    
    func getCards() -> [Card] {
        
        var cards: [Card] = []
        
        for result in realm.objects(DBCard.self) {
            let card = result.convertToEntity()
            cards.append(card)
        }
        
        return cards
    }
    
    func getCardsByPack(pack: Pack) -> [Card] {
        
        var cards: [Card] = []
        
        let packCode = pack.code
        
        let predicate = NSPredicate(format: "packCode == %@", packCode)
        
        for result in realm.objects(DBCard.self).filter(predicate) {
            let card = result.convertToEntity()
            cards.append(card)
        }
        
        return cards
    }
    
    func getCardsByFaction(faction: Faction) -> [Card] {
        
        var cards: [Card] = []
        
        let factionCode = faction.code
        
        let predicate = NSPredicate(format: "factionCode == %@", factionCode)
        
        for result in realm.objects(DBCard.self).filter(predicate) {
            let card = result.convertToEntity()
            cards.append(card)
        }
        
        return cards
    }
    
    // MARK: - Helper Methods
    
    func save<T>(_ entity: T) -> Bool where T: Object {
        
        writeTransactionAndWait(transactions: { () -> Void in
            
            realm.add(entity, update: .all)
            
        }, completionClosure: { (_) -> Void in})
        
        return true
    }
    
    func remove<T>(_ entity: T) -> Bool where T: Object {
        
        writeTransactionAndWait(transactions: { () -> Void in
            
            realm.delete(entity)
            
        }, completionClosure: { (_) -> Void in})
        
        return true
    }
}

// MARK: - Private Methods

fileprivate extension DBManager {
    
    func createConfiguration() {
        
        /*#if PRO_ENVIRONMENT && !DEBUG
            configuration = Realm.Configuration(encryptionKey: getKey(),
                                                deleteRealmIfMigrationNeeded: true)
        #else
            configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        #endif*/
        
        configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        
        configureDatabasePath()
    }
    
    func createMemoryConfiguration(identifier: String) {
        
        configuration = Realm.Configuration(inMemoryIdentifier: identifier,
                                            deleteRealmIfMigrationNeeded: true)
    }
    
    func createRealm() -> Realm {
        
        do {
            return try Realm(configuration: configuration)
        } catch {
            print("RealmManager: Failed to open the database with current configuration: \(error)")
            exit(0)
        }
    }
    
    func getKey() -> Data {
        
        let data = keychainIdentifierString.data(using: .utf8) ?? Data()
        let digest = SHA256.hash(data: data)
        return digest.data
    }
    
    func configureDatabasePath() {
        
        guard let realmFilename = Realm.Configuration.defaultConfiguration.fileURL?.lastPathComponent else {
            fatalError("RealmManager: Default Configuration not working")
        }
        guard let urlDocumentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("RealmManager: Document path not found")
        }
        let urlRealmDirectory = urlDocumentsPath.appendingPathComponent("Realm")
        let urlRealmDB = urlRealmDirectory.appendingPathComponent(realmFilename)
        
        if FileManager.default.fileExists(atPath: urlRealmDirectory.path) == false {
            guard let _ = try? FileManager.default.createDirectory(at: urlRealmDirectory, withIntermediateDirectories: true, attributes: nil) else {
                fatalError("RealmManager: Can't create directory")
            }
        }
        
        configuration.fileURL = urlRealmDB
        
        print("RealmManager: Realm database path: \(urlRealmDB)")
    }
    
    func writeTransactionAndWait(transactions: (() -> Void), completionClosure: ((Realm.Error?) -> Void)) {
        do {
            try realm.write({ () -> Void in
                transactions()
            })
            completionClosure(nil)
        } catch {
            let error = NSError(domain: "MyArkham-Realm-Error",
                                             code: 1, userInfo: [NSLocalizedDescriptionKey: "Realm Problem"]) as? Realm.Error
            completionClosure(error)
        }
    }
}
