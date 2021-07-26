//
//  SellViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 24/07/21.
//

import UIKit

class SellViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    
    @IBOutlet weak var publishButton: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    let categories = ["Plasticos", "Químicos", "Vidros", "Metais", "Tecido", "Madeira", "Eletrônicos", "Borracha"]
    
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
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func publicarBtn(_ sender: Any) {
        
        
        var item = Item(title: titleText.text, amount: amountText.text!, price: 10.0, image: "image-item-1.png", created: "25.07.2021", info: "O mundo esta cheio de anteas que podem ser recicladas", seller: Seller(name: "Gabriela Silva", location: "Curitiba/PR", contact: "99987886"), productId: 8)
        sellRepository.criarAnuncio(item: item)
    
        
        /*
        var title :String?
        var amount :String
        var price :Float?
        var image :String?
        var created :String?
        var info :String?
        var seller :Seller?
        var productId :Int? // Para poder enviar request de criação */
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
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        self.imgView.image = image
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
