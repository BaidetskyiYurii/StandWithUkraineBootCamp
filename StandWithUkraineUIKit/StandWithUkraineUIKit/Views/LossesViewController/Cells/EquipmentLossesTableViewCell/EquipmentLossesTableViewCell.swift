//
//  EquipmentLossesTableViewCell.swift
//  StandWithUkraineUIKit
//
//  Created by Baidetskyi Jurii on 27.08.2023.
//

import UIKit

class EquipmentLossesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayOfWarLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var warDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configCell(with model: EquipmentLossesModel) {
        dayOfWarLabel.text = String(model.day) + " day of heroic resistance!"
        warDateLabel.text = model.date

    }
}
