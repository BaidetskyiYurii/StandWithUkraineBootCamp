//
//  MilitaryEntry.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import Foundation

struct EquipmentLossesModel: Codable, Identifiable, Equatable, Hashable {
    var id = UUID()
    
    let date: String
    let day: Int
    let aircraft: Int
    let helicopter: Int
    let tank: Int
    let APC: Int
    let fieldArtillery: Int
    let MRL: Int
    let militaryAuto: Int?
    let fuelTank: Int?
    let drone: Int
    let navalShip: Int
    let antiAircraftWarfare: Int
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
        case aircraft
        case helicopter
        case tank
        case APC
        case fieldArtillery = "field artillery"
        case MRL
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
    }
}

extension EquipmentLossesModel {
    static var testModel: EquipmentLossesModel {
        return EquipmentLossesModel(
            date: "2022-04-05",
            day: 41,
            aircraft: 10,
            helicopter: 7,
            tank: 80,
            APC: 516,
            fieldArtillery: 49,
            MRL: 4,
            militaryAuto: 100,
            fuelTank: 60,
            drone: 0,
            navalShip: 2,
            antiAircraftWarfare: 0
        )
    }
}
