//
//  Tab.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 25.08.2023.
//

import Foundation

enum Tab: String, CaseIterable {
    case equipment
    case personnel
    
    var title: String {
        switch self {
        case .equipment:
            return "Equipment"
        case .personnel:
            return "Personnel"
        }
    }
    
    var image: String {
        switch self {
        case .equipment:
            return "equipmentTabIcon"
        case .personnel:
            return "personnelTabIcon"
        }
    }
}
