//
//  VC + UITableViewDelegate.swift
//  StandWithUkraineUIKit
//
//  Created by Baidetskyi Jurii on 27.08.2023.
//

import UIKit

extension LossesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 20))
        headerView.backgroundColor = UIColor(named: "themeBackground")
        
        let headerLabel = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.bounds.size.width - 16, height: 40))
        
        switch section {
        case 0:
            headerLabel.text = "Personnel Losses"
            
        case 1:
            headerLabel.text = "Equipment Losses"
            
        default:
            return nil
        }
        
        headerLabel.textColor = .white
        headerLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        
        switch section {
        case 0:
            return 120
        case 1:
            return 130
        default:
            return 100
        }
    }
}
