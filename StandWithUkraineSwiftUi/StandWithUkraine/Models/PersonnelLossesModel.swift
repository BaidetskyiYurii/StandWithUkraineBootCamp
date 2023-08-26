//
//  PersonnelLossesModel.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import Foundation

struct PersonnelLossesModel: Codable, Identifiable, Equatable, Hashable {
    var id = UUID()
    let date: String
    let day: Int
    let personnel: Int
    let personnelDescription: String
    let POW: Int?
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case personnel
        case personnelDescription = "personnel*"
        case POW
    }
}

extension PersonnelLossesModel {
    static var testModel: PersonnelLossesModel {
        return PersonnelLossesModel (
            date: "2023-08-25",
            day: 3,
            personnel: 10,
            personnelDescription: "Test description",
            POW: 2
        )
    }
}
