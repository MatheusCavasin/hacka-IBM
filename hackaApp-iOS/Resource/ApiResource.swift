//
//  ApiResource.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 24/07/21.
//

import Foundation

class ApiResource{
    
    
    static func request(method: String, url: String, params: [String: Any]? = nil, body: Data? = nil, withAuth: Bool = false,
                     completion: @escaping (Any?, Error?) -> Void){

        print("entrou em request")
        //URL válida
        guard let URL = URL(string: url) else {
            completion(nil, nil)
            return
        }
        
        //Cria a representacão da requisição
        let request = NSMutableURLRequest(url: URL)
        //Atribui à requisiçāo o método parassado como parâmetro
        request.httpMethod = method.uppercased()
        
        if withAuth {
            
            //Set das variáveis utilizadas na Basic Authentication
            let username = UserDefaults.standard.string(forKey: "Usuario")!
            let password = UserDefaults.standard.string(forKey: "senha")!
            let loginString = "\(username):\(password)"
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            
            
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        }
        
        
        //Se houver parâmetros para enviar na URL
        if params != nil{
            //Converte as chaves em String no formato de parâmetro
            let requestParams = params!.map { "\($0.0)=\($0.1)" }.joined(separator: "&")
            print(requestParams)
            print("\(url)?\(requestParams)")
            
            //Atribui nova URL na requsição com os parâmetros
            request.url = Foundation.URL(string: "\(url)?\(requestParams)")
        }
        
        //Se tiver body para enviar à requisição
        if let bodyJsonData = body{
            let jsonText = String(data: bodyJsonData, encoding: .ascii)
            let requestBody :String = jsonText ?? ""
            
            
            //Atribui o corpo à requisição
            request.httpBody = requestBody.data(using: String.Encoding.utf8)
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
            
            print(requestBody)
        }

        //Cria a tarefa de requisição
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            do {
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode: \(httpResponse.statusCode)")
                }
                
                if let data = data {
                    //A resposta chegou
                    print("RequestApi.request: A resposta chegou")
                    let response = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(data, nil)
                }
                else {
                    print("RequestApi.request: Não houve resposta")
                    //Não houve resposta
                    completion(nil, nil)
                }
            } catch let error as NSError {
                //Houve um erro na comunicao com o servidor
                print("RequestApi.request: Não houve resposta")
                completion(nil, error)
            }
        }
        
        
        //Aciona a tarefa
        task.resume()
    }
}
