//
//  ButtonJourneyTableViewCell.swift
//  hackaApp-iOS
//
//  Created by José Guilherme Bestel on 25/07/21.
//

import UIKit

class ButtonJourneyTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "ButtonJorneyTableViewCell2"

    static func nib() -> UINib {
        return UINib(nibName: "ButtonJorneyTableViewCell2", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(title :String, color :UIColor){
        bgView.layer.cornerRadius = 14
        bgView.backgroundColor = color
        titleLabel.text = title
    }
    
}
