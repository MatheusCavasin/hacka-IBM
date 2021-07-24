//
//  JourneyRepository.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 24/07/21.
//

import Foundation

class JourneyRepository {
    
    func getQuestions() {
        let url = Singleton.shared.apiEndPoint
        
        ApiResource.request(method: "GET", url: url, params: nil, body: nil, withAuth: false) { (result, err) in
            if result != nil {
                let dictResult = result as! Dictionary<String, Any>
                print(dictResult)
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "AnucniosCarregados"), object: nil)
                }
            }
            else {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "ErroAoCarregarAnuncios"), object: nil)
                }
            }
            
        }
    }
    
}

// exemplo para pegar os dados JSON
// var a = dictResult["questions"] as! [[String : Any?]]
// print(a[0]["title"])
