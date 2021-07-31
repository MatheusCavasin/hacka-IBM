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
    var questions :[Question] = []{
        didSet{
            self.reloadView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        journeyRepository.getQuestions(completion: { questions in
            self.questions = questions ?? []
        })

        
        topicsTableView.delegate = self
        topicsTableView.dataSource = self
        self.topicsTableView.register(ProblemTableViewCell.nib(), forCellReuseIdentifier: ProblemTableViewCell.identifier)
        
        let objUIImage = UIImage(named: "whatsapp")
        ImageResource.upload(name: "name-image", image: objUIImage!, completion: { response in
            if let url = response{
                //pegar a url e salvar em algum lugar
            }
        })
    }
    
    @objc func reloadView() {
        DispatchQueue.main.sync {
            self.topicsTableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.shared.questions!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProblemTableViewCell.identifier) as! ProblemTableViewCell
        // Singleton.shared.questions[0]["image"] as! String
        cell.config(imageView: Singleton.shared.questions?[indexPath.row].image ?? "", titLabel: Singleton.shared.questions?[indexPath.row].title ?? "", descLabel: Singleton.shared.questions?[indexPath.row].description ?? "", viewColor: (indexPath.row % 2))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false //Melhora a navegaçao
        self.performSegue(withIdentifier: "toProductJourney", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProductJourney"{
            let vc = segue.destination as! ProductJourneyViewController
            vc.products = self.questions[sender as? Int ?? 0].products ?? []
        }
    }

}
