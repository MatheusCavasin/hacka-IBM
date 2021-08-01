//
//  NewUserViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 31/07/21.
//

import UIKit

class NewUserViewController: UIViewController {

    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createButton.layer.cornerRadius = GeneralConfig.cornerRadius
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func createButton(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(nameTextField.text, forKey: "User")
        defaults.set(addressTextField.text, forKey: "Address")
        defaults.set(phoneTextField.text, forKey: "Phone")

        
        self.dismiss(animated: true, completion: {})
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
