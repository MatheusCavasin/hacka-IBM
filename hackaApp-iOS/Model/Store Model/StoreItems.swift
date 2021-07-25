//
//  StoreItems.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import Foundation

struct StoreItems: Codable {
    var storeItems: [StoreItem]?
    
    internal enum CondingKeys : String, CodingKey {
        case storeItems
    }
}

