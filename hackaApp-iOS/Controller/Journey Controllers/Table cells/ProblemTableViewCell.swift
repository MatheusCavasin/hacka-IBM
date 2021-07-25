//
//  ProblemTableViewCell.swift
//  hackaApp-iOS
//
//  Created by M Cavasin on 24/07/21.
//

import UIKit

class ProblemTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    
    static let identifier = "ProblemTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "ProblemTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(imageView: String, titLabel: String, descLabel: String, viewColor: Int) {
        
        if viewColor == 0 {
            self.backView.layer.borderColor = GeneralConfig.viewBorderColor1
        } else {
            self.backView.layer.borderColor = GeneralConfig.viewBorderColor2
        }
        self.backView.layer.cornerRadius = GeneralConfig.viewCornerRadius
        self.backView.layer.borderWidth = GeneralConfig.viewBorderWidth
        
        self.imgView.image = UIImage(named: imageView)
        
        self.tituloLabel.text = titLabel
        self.descricaoLabel.text = descLabel
        
        
    }

    
}
