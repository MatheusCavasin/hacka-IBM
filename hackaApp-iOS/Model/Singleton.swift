//
//  Singleton.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 24/07/21.
//

import Foundation

class Singleton {
    static var shared = Singleton()
    
    var apiEndPoint = "https://run.mocky.io/v3/7068b42d-f803-42d6-b8db-bbeeec7b0f92"
    var questions: [Question]? = []
    var storeItems: [StoreItem]? = []
    var controller: StoreViewController!
    private init() {}
    
}
