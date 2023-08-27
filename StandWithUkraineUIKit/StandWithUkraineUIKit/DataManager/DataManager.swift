//
//  DataHelper.swift
//  StandWithUkraineUIKit
//
//  Created by Baidetskyi Jurii on 26.08.2023.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    private init() {}
    
    private let fileExtension = "json"
    
    func loadData<T: Decodable>(_ dataModelType: T.Type, fileName: String) -> [T]? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([T].self, from: data)
            
            return decodedData
        } catch {
            return nil
        }
    }
}
