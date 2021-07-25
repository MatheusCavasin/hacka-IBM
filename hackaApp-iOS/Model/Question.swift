//
//  Questions.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import Foundation

struct Question: Codable {
    var title: String?
    var description: String?
    var image: String?
    var products: [Product]?
    
    internal enum CondingKeys : String, CodingKey {
        case title, description, image, products
    }
}
