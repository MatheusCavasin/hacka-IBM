//
//  Item.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import Foundation

struct Item: Codable {
    
    var title :String?
    var amount :String
    var price :Float?
    var image :String?
    var created :String?
    var info :String?
    var seller :Seller?
    var productId :Int? // Para poder enviar request de criação
        
    internal enum CondingKeys : String, CodingKey {
        case title, amount, price, image, created, info, seller, productID
    }
}
