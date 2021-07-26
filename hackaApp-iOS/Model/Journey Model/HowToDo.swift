//
//  HowToDo.swift
//  hackaApp-iOS
//
//  Created by José Guilherme Bestel on 25/07/21.
//

import Foundation

struct HowToDo :Codable {
    var title :String?
    var subtitle :String?
    var steps :[StepToDo]?
    
    internal enum CodingKeys : String, CodingKey{
        case title, subtitle, steps
    }
}
