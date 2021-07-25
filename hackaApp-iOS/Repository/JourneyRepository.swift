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
                
                let decoder = JSONDecoder()
                do {
                    let questions = try decoder.decode(Questions.self, from: result as! Data)
                    print(questions.questions?[0].products?[0].info ?? "")
                    Singleton.shared.questions = questions.questions
                }
                catch {
                    
                }
                
                
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: Notification.Name(rawValue: "QuestionsLoaded"), object: nil) // AnucniosCarregados
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
//var a = dictResult["questions"] as! [[String : Any?]]
//print(a[0]["title"] as! String)
//a.count
