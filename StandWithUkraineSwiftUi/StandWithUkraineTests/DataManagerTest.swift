//
//  DataManagerTest.swift
//  StandWithUkraineTests
//
//  Created by Baidetskyi Jurii on 26.08.2023.
//

import XCTest
@testable import StandWithUkraine

class DataManagerTests: XCTestCase {
    
    func testLoadDataSuccess() {
        let expectation = XCTestExpectation(description: "Load data successfully")
        
        DataManager.shared.loadData(fromJSONFile: "russia_losses_personnel", fileExtension: "json", dataModelType: PersonnelLossesModel.self) { result in
            switch result {
            case .success(let data):
                XCTAssertFalse(data.isEmpty, "Loaded data should not be empty")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Loading data failed with error: \(error)")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLoadDataFileNotFound() {
        let expectation = XCTestExpectation(description: "Load data with file not found")
        
        DataManager.shared.loadData(fromJSONFile: "nonexistent", fileExtension: "json", dataModelType: PersonnelLossesModel.self) { result in
            switch result {
            case .success(_):
                XCTFail("Loading data should have failed")
            case .failure(let error):
                XCTAssertEqual(error as? AppErrors, AppErrors.fileNotFound, "Error should be file not found")
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testLoadDataDecodingError() {
        let expectation = XCTestExpectation(description: "Load data with decoding error")
        
        DataManager.shared.loadData(fromJSONFile: "russia_losses_personnel", fileExtension: "json", dataModelType: EquipmentLossesModel.self) { result in
            switch result {
            case .success(_):
                XCTFail("Loading data should have failed")
            case .failure(let error):
                XCTAssertTrue(error is DecodingError, "Error should be a decoding error")
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
