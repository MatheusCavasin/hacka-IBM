//
//  ProductJourneyViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import UIKit

class ProductJourneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var productsTableView: UITableView!
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
        cell.config(imageView: "oleoCozinha", descLabel: product.title ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        self.performSegue(withIdentifier: "toInstructionsJourney", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInstructionsJourney"{
            let vc = segue.destination as! InstructionsJourneyViewController
            
            let product = products[sender as? Int ?? 0]
            if let how = product.howtodo{
                vc.howtodo = how[0]
            }
        }
    }
}
