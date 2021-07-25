//
//  JourneyViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 24/07/21.
//

import UIKit

class JourneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let journeyRepository = JourneyRepository()


    @IBOutlet weak var topicsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        journeyRepository.getQuestions()

        
        topicsTableView.delegate = self
        topicsTableView.dataSource = self
        self.topicsTableView.register(ProblemTableViewCell.nib(), forCellReuseIdentifier: ProblemTableViewCell.identifier)
        
        //Observables
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadView), name: NSNotification.Name(rawValue: "QuestionsLoaded"), object: nil)
    }
    
    @objc func reloadView() {
        self.topicsTableView.reloadData()
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.shared.questions!.count
//        Singleton.shared.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProblemTableViewCell.identifier) as! ProblemTableViewCell
        // Singleton.shared.questions[0]["image"] as! String
        cell.config(imageView: Singleton.shared.questions?[indexPath.row].image ?? "", titLabel: Singleton.shared.questions?[indexPath.row].title ?? "", descLabel: Singleton.shared.questions?[indexPath.row].description ?? "", viewColor: (indexPath.row % 2))
        return cell
    }
    
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

}
