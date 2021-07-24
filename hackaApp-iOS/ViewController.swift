//
//  ViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 24/07/21.
//

import UIKit

class ViewController: UIViewController {

    let journeyRepository = JourneyRepository()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func teste(_ sender: Any) {
        
        journeyRepository.getQuestions()
    }
    
}

