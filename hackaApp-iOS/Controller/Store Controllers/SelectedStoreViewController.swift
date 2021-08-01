//
//  SelectedStoreViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import UIKit

class SelectedStoreViewController: UIViewController {


    
    
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var sellerImg: UIImageView!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var amountProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var infoText: UITextView!
    
    
    
    
    var iten: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sellerImg.layer.cornerRadius = 6.0
        
        self.dataLabel.text = iten.created
        self.addressLabel.text = iten.seller?.location
        self.nameLabel.text = iten.seller?.name
        self.imgProduct.kf.setImage(with: URL(string: iten.image!))
        self.imgProduct.layer.cornerRadius = CGFloat(20.0)
        
        self.titleProduct.text = iten.title ?? ""
        self.priceProduct.text = "$ \(String(iten.price ?? 0.0))"
        self.amountProduct.text = "\(iten.amount) - aviable"
        self.infoText.text = iten.info
        
        
    }

}
