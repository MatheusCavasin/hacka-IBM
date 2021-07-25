//
//  StoreViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import UIKit

class StoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var storeTableView: UITableView!
    
    
    let storeRepository = StoreRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeRepository.getStoreItems()
        
        
        storeTableView.delegate = self
        storeTableView.dataSource = self
        self.storeTableView.register(StoreCollectionTableViewCell.nib(), forCellReuseIdentifier: StoreCollectionTableViewCell.identifier)
        
        //Observables
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadView), name: NSNotification.Name(rawValue: "StoreItemsLoaded"), object: nil)
    }
    
    @objc func reloadView() {
        self.storeTableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.shared.storeItems!.count
        //        Singleton.shared.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StoreCollectionTableViewCell.identifier) as! StoreCollectionTableViewCell
        cell.configure(with: indexPath.row)
        return cell
    }
    
    /*
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false //Melhora a navegaçao
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ProductJourney") as? ProductJourneyViewController {
            
            let controller: ProductJourneyViewController!
            //            let view = UIStoryboard(name: "Journey", bundle: nil)
            //            controller = view.instantiateViewController(identifier: "ProductJourney") as ProductJourneyViewController
            //            controller.index = 2
            //            navigationController?.show(controller, sender: self)
            //
            if let vc = storyboard?.instantiateViewController(withIdentifier: "ProductJourney") as? ProductJourneyViewController {
                vc.index = Singleton.shared.questions?[indexPath.row].products?.count
                self.present(vc, animated:true, completion: {
                })
            }
        }
    }
    
    */
    
    
}
