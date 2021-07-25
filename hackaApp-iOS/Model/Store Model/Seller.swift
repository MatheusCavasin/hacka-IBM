//
//  Seller.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import Foundation

struct Seller: Codable {
    
    var name :String?
    var location :String
    var contact :String?
    
    
    internal enum CondingKeys : String, CodingKey {
        case name, location, contact
    }
}
