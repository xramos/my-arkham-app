//
//  Digest+Default.swift
//  MyArkham
//
//  Created by Xavi on 18/12/21.
//

import Foundation
import CryptoKit

extension Digest {
    
    var bytes: [UInt8] { Array(makeIterator()) }
    var data: Data { Data(bytes) }
}
