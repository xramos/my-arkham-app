//
//  FactionRepository.swift
//  MyArkham
//
//  Created by Xavi on 17/12/21.
//

import Foundation
import Combine

protocol FactionRepository {
    
    func getFactions() -> AnyPublisher<[Faction], Error>
}
