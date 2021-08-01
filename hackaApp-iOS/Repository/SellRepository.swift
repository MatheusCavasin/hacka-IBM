//
//  SellRepository.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import Foundation
import UIKit

class SellRepository {
    
    
    func criarAnuncio(item: Item, imageItem: UIImage){
        
        //Coloque a URL da sua API aqui
        
//        let urlBD = "https://hacka-ibm-team-24.herokuapp.com/api/v1/store"
        let urlBD = "https://820b2565.us-south.apigw.appdomain.cloud/ibm-gateway/api/v1/store"
        var itemProduct = item
//        let produtorDict = anuncioDictionary()

//            let objUIImage = UIImage(named: item.image ?? "")
        
        func getJson(item: Item) -> Data?{
            do {
                let enconder = JSONEncoder()
                let jsonData = try enconder.encode(itemProduct)
                return jsonData
            }
            catch {
                return nil
            }
        }
        
            ImageResource.upload(name: "name-image1", image: imageItem, completion: { response in
                if let url = response{
                    //pegar a url e salvar em algum lugar
                    Singleton.shared.urlIMagem = url.absoluteString
                    itemProduct.image = url.absoluteString
                    print(url)
                    
                    let jsonData = getJson(item: itemProduct)
                    
                    ApiResource.request(method: "POST", url: urlBD, params: nil, body: jsonData, withAuth: false){
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
            })
        
            
            
     
        
        //Chamando a funcão POST produtor
        
    }
}
/* https://firebasestorage.googleapis.com/v0/b/transform-cycle.appspot.com/o/name-image?alt=media&token=f444a58d-06a2-432d-9dca-821390060a11
*/
