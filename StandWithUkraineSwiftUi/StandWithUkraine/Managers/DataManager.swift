//
//  DataManager.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 24.08.2023.
//

import Foundation

final class DataManager: ObservableObject {
    @Published var viewState: ViewState = .loading
    
    static let shared = DataManager()
    private init() {}
    
    func loadData<T: Decodable>(fromJSONFile fileName: String,
                                fileExtension: String,
                                dataModelType: T.Type,
                                completion: @escaping (Result<[T], Error>) -> Void) {
        self.viewState = .loading
        //Simulate api request
        DispatchQueue.global().asyncAfter(deadline: .now() + 1){
            guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
                DispatchQueue.main.async {
                    self.viewState = .empty
                    completion(.failure(AppErrors.fileNotFound))
                }
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([T].self, from: data)
                
                DispatchQueue.main.async {
                    self.viewState = .content
                    completion(.success(decodedData))
                }
            } catch {
                DispatchQueue.main.async {
                    self.viewState = .empty
                    completion(.failure(error))
                }
            }
        }
    }
}
