//
//  EquipmentLossesViewModel.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

final class EquipmentLossesViewModel: ObservableObject {
    @ObservedObject var dataManager: DataManager = .shared
    @Published var militaryData: [EquipmentLossesModel] = []
    
    init() {
        getData()
    }
    
    private func getData() {
        dataManager.loadData(fromJSONFile: "russia_losses_equipment",
                             fileExtension: "json",
                             dataModelType: EquipmentLossesModel.self) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let equipmentData):
                DispatchQueue.main.async {
                    self.militaryData = equipmentData
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error)
                }
            }
        }
    }
}
