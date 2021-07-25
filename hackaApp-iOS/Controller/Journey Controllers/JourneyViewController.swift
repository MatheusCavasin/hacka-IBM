//
//  JourneyViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 24/07/21.
//

import UIKit

class JourneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var topicsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topicsTableView.delegate = self
        topicsTableView.dataSource = self
        self.topicsTableView.register(ProblemTableViewCell.nib(), forCellReuseIdentifier: ProblemTableViewCell.identifier)

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProblemTableViewCell.identifier) as! ProblemTableViewCell
        cell.config(imageView: "turtle", titLabel: "Plásticos no oceano", descLabel: "Ajude a salvar as tartarugas e outros animais terrestres", viewColor: (indexPath.row % 2))
        return cell
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
