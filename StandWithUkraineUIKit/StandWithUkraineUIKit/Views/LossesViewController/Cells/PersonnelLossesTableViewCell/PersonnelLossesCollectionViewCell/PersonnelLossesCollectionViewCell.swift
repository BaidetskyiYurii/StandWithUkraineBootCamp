//
//  PersonnelLossesCollectionViewCell.swift
//  StandWithUkraineUIKit
//
//  Created by Baidetskyi Jurii on 27.08.2023.
//

import UIKit

class PersonnelLossesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var dayOfWar: UILabel!
    @IBOutlet weak var personnelLosees: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell( with model: PersonnelLossesModel) {
        dayOfWar.text = "Day of War: " + String(model.day)
        personnelLosees.text = "Personnel Losses: " + String(model.personnel)
    }
}
