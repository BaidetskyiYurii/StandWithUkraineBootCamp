//
//  ViewSpec.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

enum ViewSpec: Equatable, Hashable {
    case equipmentListItem(item: EquipmentLossesModel)
}

extension ViewSpec: Identifiable {
    var id: Self { self }
}
