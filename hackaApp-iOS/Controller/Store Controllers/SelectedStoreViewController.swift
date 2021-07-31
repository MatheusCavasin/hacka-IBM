//
//  SelectedStoreViewController.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import UIKit

class SelectedStoreViewController: UIViewController {


    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var amountProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
    @IBOutlet weak var infoText: UITextView!
    
    var iten: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.imgProduct.image = UIImage(named: iten.image ?? "")
        self.imgProduct.layer.cornerRadius = CGFloat(20.0)
        self.titleProduct.text = iten.title ?? ""
        self.priceProduct.text = String(iten.price ?? 0.0)
        self.amountProduct.text = iten.amount
        infoText.text = iten.info
        
        
    }

}
