//
//  Products.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import Foundation

struct Product: Codable {
    var title: String?
    var image: String?
    var info: String?
    var category: String?
    var howtodo :[HowToDo]?
    
    internal enum CondingKeys : String, CodingKey {
        case title, image, info, category, howtodo
    }
}
