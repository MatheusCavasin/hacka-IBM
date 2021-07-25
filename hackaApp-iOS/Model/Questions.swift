//
//  Questions.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import Foundation

struct Questions: Codable {
    var questions: [Question]?
    
    internal enum CondingKeys : String, CodingKey {
        case questions
    }
}
