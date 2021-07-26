//
//  BtnJourneyTableViewCell.swift
//  hackaApp-iOS
//
//  Created by José Guilherme Bestel on 25/07/21.
//

import UIKit

class BtnJourneyTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    static let identifier = "BtnJourneyTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "BtnJourneyTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(title :String, color :UIColor, titleColor :UIColor){
        btnView.layer.cornerRadius = 14
        btnView.backgroundColor = color
        titleLabel.text = title
        titleLabel.textColor = titleColor
    }
    
}
