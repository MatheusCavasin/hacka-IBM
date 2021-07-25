//
//  ProductJourneyTableViewCell.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 25/07/21.
//

import UIKit

class ProductJourneyTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    
    static let identifier = "ProductJourneyTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "ProductJourneyTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(imageView: String, descLabel: String) {
                
        self.imgView.image = UIImage(named: imageView)
        
        self.descricaoLabel.text = descLabel
        
        
    }

    
}
