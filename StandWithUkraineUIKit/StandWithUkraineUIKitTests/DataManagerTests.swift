//
//  DataManagerTests.swift
//  StandWithUkraineUIKitTests
//
//  Created by Baidetskyi Jurii on 27.08.2023.
//

import XCTest
@testable import StandWithUkraineUIKit

class DataManagerTests: XCTestCase {
    func testLoadData_Success() {

        let fileName = "russia_losses_equipment"
        let dataManager = DataManager.shared
        
        // Act
        let loadedData: [EquipmentLossesModel]? = dataManager.loadData(EquipmentLossesModel.self, fileName: fileName)
        
        // Assert
        XCTAssertNotNil(loadedData)
    }
    
    func testLoadData_Failure() {
        // Arrange
        let fileName = "nonExistentFile"
        let dataManager = DataManager.shared
        
        // Act
        let loadedData: [EquipmentLossesModel]? = dataManager.loadData(EquipmentLossesModel.self, fileName: fileName)
        
        // Assert
        XCTAssertNil(loadedData)
    }
}
