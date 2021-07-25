//
//  StoreItem.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import Foundation


struct StoreItem: Codable {
    var category: String?
    var items: [Item]?
    
    internal enum CondingKeys : String, CodingKey {
        case category, items
    }
}


/*
struct StoreItem: Codable {
    
    var title :String?
    var amount :String
    var price :Float?
    var image :String?
    var created :String?
    var info :String?
    var seller :Seller?
    var productId :Int? // Para poder enviar request de criação
    
    
    var products: [Product]?
    
    internal enum CondingKeys : String, CodingKey {
        case title, description, image, products
    }
}
*/
