//
//  PersonnelLossesViewModel.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 24.08.2023.
//

import SwiftUI

final class PersonnelLossesViewModel: ObservableObject {
    @ObservedObject var dataManager: DataManager = .shared
    @Published var militaryData: [PersonnelLossesModel] = []
    
    init() {
        getData()
    }
    
    private func getData() {
        dataManager.loadData(fromJSONFile: "russia_losses_personnel",
                             fileExtension: "json",
                             dataModelType: PersonnelLossesModel.self) { [weak self] result in
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
