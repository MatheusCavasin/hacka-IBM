//
//  ProductJourneyViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import UIKit

class ProductJourneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var productsTableView: UITableView!
    
//    var index: Int! // indice da coluna selecionada
//    var productsArray: [Product]!
    var products :[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productsTableView.delegate = self
        productsTableView.dataSource = self
        self.productsTableView.register(ProductJourneyTableViewCell.nib(), forCellReuseIdentifier: ProductJourneyTableViewCell.identifier)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductJourneyTableViewCell.identifier) as! ProductJourneyTableViewCell
        let product = products[indexPath.row]
        
//        cell.config(imageView: product.image ?? "", descLabel: product.title ?? "")
        cell.config(imageView: "oleoCozinha", descLabel: product.title ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ProductJourneyTableViewCell selected: \(indexPath.row)")
        let product = products[indexPath.row]
        
        if let vc = storyboard?.instantiateViewController(identifier: "InstructionsJourney") as? InstructionsJourneyViewController{
            vc.modalPresentationStyle = .fullScreen
            if let how = product.howtodo{
                vc.howtodo = how[0]
                self.present(vc, animated: false, completion: {})
            }else{
                print("ERROR => product without howToDo object")
            }
        }
        
    }
}
