//
//  LossesTableCellTypes.swift
//  StandWithUkraineUIKit
//
//  Created by Baidetskyi Jurii on 27.08.2023.
//

import Foundation

enum LossesTableCellTypes {
    case personnelLosses([PersonnelLossesModel])
    case equipmentlLosses(EquipmentLossesModel)
    
    var nibName: String {
        switch self {
        case .personnelLosses(_):
            return "PersonnelLossesTableViewCell"
        case .equipmentlLosses(_):
            return "EquipmentLossesTableViewCell"
        }
    }
    
    var indentifier: String {
        switch self {
        case .personnelLosses(_), .equipmentlLosses(_):
            return nibName
        }
    }
}
