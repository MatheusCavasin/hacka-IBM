//
//  SellRepository.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import Foundation

class SellRepository {
    
    
    func criarAnuncio(item: Item){
        
        //Coloque a URL da sua API aqui
        
        let url = "https://hacka-ibm-team-24.herokuapp.com/api/v1/store"
//        let produtorDict = anuncioDictionary()
        do {
            let enconder = JSONEncoder()
            let jsonData = try enconder.encode(item)
            ApiResource.request(method: "POST", url: url, params: nil, body: jsonData, withAuth: false){
                (result, err)  in
                //Aqui você tem seu resultado
                if let result = result  {
                    //Aqui res podera assumir dois valores, true ou false
                    print("sua requisicao foi realizada com sucesso")
                    print(result)
                } else {
                    //Aqui voce pode tratar os erros
                    print("a requisicao nao funcionou")
                    print(err)
                }
                
            }
            
        }
        catch {
            
        }
        
        //Chamando a funcão POST produtor
        
    }
}
