//
//  InstructionsJorneyTableViewCell.swift
//  hackaApp-iOS
//
//  Created by José Guilherme Bestel on 25/07/21.
//

import UIKit

class InstructionsJorneyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "InstructionsJorneyTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "InstructionsJorneyTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(descriptionLabel :String, index :Int){
        self.baseView.layer.borderWidth = 1.0
        self.baseView.layer.cornerRadius = 18.0
        if(index % 2 == 0){
            self.baseView.layer.borderColor =  GeneralConfig.viewBorderColor1
        }else{
            self.baseView.layer.borderColor =  GeneralConfig.viewBorderColor2
        }
    }
    
}
