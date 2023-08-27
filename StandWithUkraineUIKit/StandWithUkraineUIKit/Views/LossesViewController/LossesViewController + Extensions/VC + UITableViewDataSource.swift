//
//  VC + UITableViewDataSource.swift
//  StandWithUkraineUIKit
//
//  Created by Baidetskyi Jurii on 27.08.2023.
//

import UIKit

extension LossesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return items.filter { if case .personnelLosses(_) = $0 { return true } else { return false } }.count
        case 1:
            return items.filter { if case .equipmentlLosses(_) = $0 { return true } else { return false } }.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let filteredItems: [LossesTableCellTypes]
        
        switch section {
        case 0: // Personnel Losses section
            filteredItems = items.filter { if case .personnelLosses(_) = $0 { return true } else { return false } }
            
        case 1: // Equipment Losses section
            filteredItems = items.filter { if case .equipmentlLosses(_) = $0 { return true } else { return false } }
            
        default:
            filteredItems = []
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: filteredItems[indexPath.row].indentifier) else {
            return UITableViewCell()
        }
        
        switch filteredItems[indexPath.row] {
        case let .personnelLosses(personnelLosses):
            if let cell = cell as? PersonnelLossesTableViewCell {
                cell.configCell(personnelLosses)
            }
        case let .equipmentlLosses(equipmentLossesData):
            if let cell = cell as? EquipmentLossesTableViewCell {
                cell.cellBackgroundView.layer.cornerRadius = 20
                cell.configCell(with: equipmentLossesData)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let filteredItems: [LossesTableCellTypes]
        
        switch section {
        case 0: // Personnel Losses section
            filteredItems = items.filter { if case .personnelLosses(_) = $0 { return true } else { return false } }
            
        case 1: // Equipment Losses section
            filteredItems = items.filter { if case .equipmentlLosses(_) = $0 { return true } else { return false } }
            
        default:
            filteredItems = []
        }
        
        let selectedItem = filteredItems[indexPath.row]
        
        switch selectedItem {
        case .equipmentlLosses(let equipmentLosses):
            let detailVC = EquipmentDetailLossesViewController()
            detailVC.equipmentItem = equipmentLosses
            navigationController?.pushViewController(detailVC, animated: true)
            
        case .personnelLosses(_):
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
