//
//  StoreCollectionViewCell.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    static let identifier = "StoreCollectionCell"

    static func nib() -> UINib {
        return UINib(nibName: "StoreCollectionCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(categoryLabel: String, activeLabel: Bool, imageView: String, nameLabel: String, priceLabel: String) {
                
        if activeLabel {
            self.categoryLabel.text = categoryLabel
        } else {
            self.categoryLabel.isHidden = true
        }
        
        self.imgView.image = UIImage(named: imageView)
        self.nameLabel.text = nameLabel
        self.priceLabel.text = priceLabel
        
        
        
        
    }

}
