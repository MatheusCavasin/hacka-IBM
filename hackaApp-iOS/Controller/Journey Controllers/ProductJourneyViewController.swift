//
//  ProductJourneyViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import UIKit

class ProductJourneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var productsTableView: UITableView!
    
    var index: Int! // indice da coluna selecionada
//    var productsArray: [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productsTableView.delegate = self
        productsTableView.dataSource = self
        self.productsTableView.register(ProductJourneyTableViewCell.nib(), forCellReuseIdentifier: ProductJourneyTableViewCell.identifier)

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return index
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductJourneyTableViewCell.identifier) as! ProductJourneyTableViewCell
        let productsArray = Singleton.shared.questions?[indexPath.row].products
        cell.config(imageView: "oleoCozinha", descLabel: productsArray?[indexPath.row].title ?? "")
        return cell
    }
}
