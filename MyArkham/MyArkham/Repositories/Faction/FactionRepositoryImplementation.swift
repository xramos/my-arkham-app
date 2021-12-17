//
//  FactionRepositoryImplementation.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation
import Combine

class FactionRepositoryImplementation: FactionRepository {
    
    private let remoteDataSource: RemoteFactionDataSource
    private let localDataSource: LocalFactionDataSource
    
    init(remoteDataSource: RemoteFactionDataSource = RemoteFactionDataSource(),
         localDataSource: LocalFactionDataSource = LocalFactionDataSource()) {
        
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getFactions() -> AnyPublisher<[Faction], Error> {
        
        if remoteDataSource.isGetFactionsCacheAvailable() {
            
            // Get factions from DDBB
            let factions = localDataSource.getFactions()
            
            return Result.Publisher(factions).eraseToAnyPublisher()
            
        } else {
            
            // Make network call
            return remoteDataSource.getFactions().map { serverFactions -> [Faction] in
                
                var factions: [Faction] = []
                
                // Convert soaentities to entities and save to Core Data
                for serverFaction in serverFactions {
                    
                    let faction = serverFaction.convertToEntity()
                    
                    self.localDataSource.saveFaction(faction: faction)
                    
                    factions.append(faction)
                }
                
                // Save Cache
                self.remoteDataSource.addGetFactionsCache()
                
                // Return entities
                return factions
            }
            .mapError({ $0 })
            .eraseToAnyPublisher()
        }
    }
}
