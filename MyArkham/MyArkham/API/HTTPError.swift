//
//  HTTPError.swift
//  MyArkham
//
//  Created by Xavi on 16/12/21.
//

import Foundation

enum HTTPError: LocalizedError, Equatable {
    case invalidResponse
    case invalidStatusCode
}
