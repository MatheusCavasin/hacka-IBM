//
//  SellViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 24/07/21.
//

import UIKit
import Kingfisher

class SellViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    
    @IBOutlet weak var publishButton: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    let categories = ["Plastics", "Chemicals", "Glass", "Metals", "Fabrics", "Woods", "Electronics"]
    
    var sellRepository = SellRepository()
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        return formatter
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        publishButton.layer.cornerRadius = GeneralConfig.cornerRadius
        imgView.image = UIImage(named: "imgDefault")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTap(tapGestureRecognizer:)))
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tapGestureRecognizer)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        if UserDefaults.standard.string(forKey: "User") == nil {
            self.publishButton.layer.backgroundColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
        } else {
            self.publishButton.layer.backgroundColor = #colorLiteral(red: 0.5843137255, green: 0.6235294118, blue: 0.4117647059, alpha: 1)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        clearData()
        
        
    }
    
    func clearData() {
        self.imgView.image = UIImage(named: "imgDefault")
        self.titleText.text = ""
        self.amountText.text = ""
        self.priceText.text = ""
    }
    
    @IBAction func publicarBtn(_ sender: Any) {
        
        
        if UserDefaults.standard.string(forKey: "User") == nil {
            
            if let vc = storyboard?.instantiateViewController(identifier: "NewUserViewController") as? NewUserViewController {
                self.present(vc, animated: true, completion: {})
            }
        }
        else {
            var idProduct = pickerView.selectedRow(inComponent: 0)
            
            switch idProduct {
            case 0:
                idProduct = 2
            case 1:
                idProduct = 15
            case 2:
                idProduct = 40
            case 3:
                idProduct = 52
            case 4:
                idProduct = 70
            case 5:
                idProduct = 77
            default:
                idProduct = 93
            }
            
            print(pickerView.selectedRow(inComponent: 0))
            
            
            let item = Item(title: titleText.text, amount: amountText.text!, price: NumberFormatter().number(from: priceText.text ?? "0.0")!.floatValue, image: "", created: "", info: "", seller: Seller(name: UserDefaults.standard.string(forKey: "User"), location: UserDefaults.standard.string(forKey: "Address")!, contact: UserDefaults.standard.string(forKey: "Phone")!), productId: idProduct)
            sellRepository.criarAnuncio(item: item, imageItem: imgView.image!)
            print(item)
            clearData()
            
        }
        
        
        //        var item = Item(title: "TESTE123", amount: "100", price: 10.0, image: "globoHome", created: "25.07.2021", info: "O mundo esta cheio de anteas que podem ser recicladas", seller: Seller(name: "Gabriela Silva", location: "Curitiba/PR", contact: "99987886"), productId: 2)
        //        sellRepository.criarAnuncio(item: item, imageItem: UIImage(named: "globoHome")!)
        //
        
    }
    
    
    
    @objc func imageTap(tapGestureRecognizer: UITapGestureRecognizer) {
        
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        
        picker.dismiss(animated: true, completion: {
            self.imgView.image = image
        })
    }

}

extension SellViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(categories[row])
    }
    
}
