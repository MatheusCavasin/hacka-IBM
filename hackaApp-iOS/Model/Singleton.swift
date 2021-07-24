//
//  Singleton.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 24/07/21.
//

import Foundation

class Singleton {
    static var shared = Singleton()
    
    var apiEndPoint = "https://run.mocky.io/v3/891ff141-8e96-488e-ab4d-88195ad4e1c2"
    
    private init() {}
    
}
