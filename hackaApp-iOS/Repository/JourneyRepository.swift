//
//  JourneyRepository.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 24/07/21.
//

import Foundation

class JourneyRepository {
    
//    let endpoint = "https://hacka-ibm-team-24.herokuapp.com/api/v1/question"
    let endpoint = "https://820b2565.us-south.apigw.appdomain.cloud/ibm-gateway/api/v1/question"
    
    func getQuestions(completion: @escaping ([Question]?) -> Void) {
        ApiResource.request(method: "GET", url: endpoint) { (result, err) in
            if result != nil {
                
                let decoder = JSONDecoder()
                do {
                    let questions = try decoder.decode(Questions.self, from: result as! Data)
                    print(questions.questions?[0].products?[0].info ?? "")
                    Singleton.shared.questions = questions.questions
                    completion(questions.questions)
                }
                catch let error{
                    print(error)
                }
            }
            else {
            }
        }
    }
}
