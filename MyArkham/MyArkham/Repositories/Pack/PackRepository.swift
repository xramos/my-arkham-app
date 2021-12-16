//
//  PackRepository.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import Foundation
import Combine

protocol PackRepository {
    
    func getPacks() -> AnyPublisher<[Pack], Error>
}
