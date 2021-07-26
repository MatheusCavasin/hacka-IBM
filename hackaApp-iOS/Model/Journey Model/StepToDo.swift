//
//  StepToDo.swift
//  hackaApp-iOS
//
//  Created by José Guilherme Bestel on 25/07/21.
//

import Foundation

struct StepToDo: Codable{
    var sequence :Int?
    var description :String?

    internal enum CondingKeys : String, CodingKey {
        case seqence, description
    }
}
