//
//  EquipmentLossesItemViewModel.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 25.08.2023.
//

import Foundation

final class EquipmentLossesItemViewModel: ObservableObject {
    @Published var item: EquipmentLossesModel
    @Published var labelDefinitions: [LabelDefinition]
    
    init(item: EquipmentLossesModel) {
        self.item = item
        
        var definitions: [LabelDefinition] = []
        
        definitions.append(LabelDefinition(itemName: "Tanks", itemLosses: item.tank))
        definitions.append(LabelDefinition(itemName: "Aircrafts", itemLosses: item.aircraft))
        definitions.append(LabelDefinition(itemName: "Helicopters", itemLosses: item.helicopter))
        definitions.append(LabelDefinition(itemName: "Armored Personnel Carriers", itemLosses: item.APC))
        definitions.append(LabelDefinition(itemName: "Field Artillery Systems", itemLosses: item.fieldArtillery))
        definitions.append(LabelDefinition(itemName: "Multiple Rocket Launchers", itemLosses: item.MRL))
        definitions.append(LabelDefinition(itemName: "Drones (UAV+RPA)", itemLosses: item.drone))
        definitions.append(LabelDefinition(itemName: "Naval Ships (Warships, Boats)", itemLosses: item.navalShip))
        definitions.append(LabelDefinition(itemName: "Anti-aircraft Warfare Systems", itemLosses: item.antiAircraftWarfare))
        
        if let militaryAuto = item.militaryAuto,
           let fuelTank = item.fuelTank {
            definitions.append(LabelDefinition(itemName: "Military Autos", itemLosses: militaryAuto))
            definitions.append(LabelDefinition(itemName: "Fuel Tanks", itemLosses: fuelTank))
        }
        
        self.labelDefinitions = definitions
    }
}
