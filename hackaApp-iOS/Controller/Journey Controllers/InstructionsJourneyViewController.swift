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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return howtodo?.steps?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.alpha = 0.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InstructionsJorneyTableViewCell.identifier) as! InstructionsJorneyTableViewCell
        let step :StepToDo? = howtodo?.steps?[indexPath.row]
        cell.config(descriptionLabel: step?.description ?? "", index: indexPath.row)
        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
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
