//
//  RemoteFactionDataSource.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation
import Combine

class RemoteFactionDataSource {
    
    static let getFactionsURL: String = "factions"
    static let getFactionsCacheTime: Double = CacheTime.long.rawValue
    
    private let baseURLString: String
    private let cache: Caching
    private let session: URLSession
    
    init(baseURL: String = Constants.baseURL, cache: Caching = Cache(type: CacheType.remote), session: URLSession = URLSession.shared) {
        
        self.baseURLString = baseURL
        self.cache = cache
        self.session = session
    }
    
    func getFactions() -> AnyPublisher<[ServerFaction], Error> {
        
        let apiManager = ApiManager(baseURL: baseURLString,
                                    session: session)
        
        let urlRequest = getFactionsEndpoint()
        
        return apiManager.performRequest(urlRequest: urlRequest)
    }
}

// MARK: - Endpoints

extension RemoteFactionDataSource {
    
    func getFactionsEndpoint() -> URLRequest {
        
        let endpoint = "\(baseURLString)\(RemoteFactionDataSource.getFactionsURL)"
        
        let url = URL(string: endpoint)
        
        let urlRequest = URLRequest(url: url!)
        
        return urlRequest
    }
}

// MARK: - Cache

extension RemoteFactionDataSource {
    
    func isGetFactionsCacheAvailable() -> Bool {
        
        return cache.isAvailable(key: RemoteFactionDataSource.getFactionsURL,
                                 cacheTime: RemoteFactionDataSource.getFactionsCacheTime)
    }
    
    func addGetFactionsCache() {
        
        cache.add(key: RemoteFactionDataSource.getFactionsURL)
    }
}
