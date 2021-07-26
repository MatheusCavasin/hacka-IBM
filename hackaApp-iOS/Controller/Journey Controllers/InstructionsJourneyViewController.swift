//
//  InstructionsJourneyViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import UIKit

class InstructionsJourneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var instructionTitle: UILabel!
    @IBOutlet weak var instructionSubtitle: UILabel!
    
    @IBOutlet weak var instructionTableView: UITableView!
    var howtodo :HowToDo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let how = howtodo{
            instructionTitle.text = how.title
            instructionSubtitle.text = how.subtitle
        }

        instructionTableView.delegate = self
        instructionTableView.dataSource = self
        self.instructionTableView.register(InstructionsJorneyTableViewCell.nib(), forCellReuseIdentifier: InstructionsJorneyTableViewCell.identifier)
        self.instructionTableView.register(BtnJourneyTableViewCell.nib(), forCellReuseIdentifier: BtnJourneyTableViewCell.identifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return howtodo?.steps?.count ?? 0
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 0){
            return 0
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.alpha = 0.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: InstructionsJorneyTableViewCell.identifier) as! InstructionsJorneyTableViewCell
            let step :StepToDo? = howtodo?.steps?[indexPath.row]
            cell.config(descriptionLabel: step?.description ?? "", index: indexPath.row)
            cell.isUserInteractionEnabled = false
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BtnJourneyTableViewCell.identifier) as! BtnJourneyTableViewCell
        if(indexPath.row == 0){
            cell.config(title: "vender", color: UIColor(cgColor: GeneralConfig.viewBorderColor2), titleColor: UIColor.white)
        }else{
            cell.config(title: "comprar", color: .white , titleColor: UIColor(cgColor: GeneralConfig.viewBorderColor2))
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 1){
            if(indexPath.row == 0){
                let storyBoard: UIStoryboard = UIStoryboard(name: "Sell", bundle: nil)
                let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "TabSell") as! SellViewController
                self.present(balanceViewController, animated: true, completion: nil)
            }else{
                let storyBoard: UIStoryboard = UIStoryboard(name: "Store", bundle: nil)
                let balanceViewController = storyBoard.instantiateViewController(withIdentifier: "TabStore") as! StoreViewController
                self.present(balanceViewController, animated: true, completion: nil)
            }
//            var id = "tabSell"
//            if(indexPath.row != 0){
//                self.performSegue(withIdentifier: "TabStore", sender: nil)
//            }
//
//            if let vc = storyboard?.instantiateViewController(identifier: id){
//                self.present(vc, animated: false, completion: {})
//            }
            
            /*
             if let vc = storyboard?.instantiateViewController(identifier: "InstructionsJourney") as? InstructionsJourneyViewController{
                 if let how = product.howtodo{
                     vc.howtodo = how[0]
                     self.present(vc, animated: false, completion: {})
                 }else{
                     print("ERROR => product without howToDo object")
                 }
             }
             */
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0){
            return 95
        }
        return 70
    }
    

    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
