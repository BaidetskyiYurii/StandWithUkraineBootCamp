//
//  UserDefaultsManager.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 25.08.2023.
//

import SwiftUI

@MainActor
final class UserDefaultsManager: ObservableObject {
    static let shared: UserDefaultsManager = .init()
    private init() {}
    
    @AppStorage(SessionManagerKeys.hasLoggedIn.rawValue) var hasLoggedIn: Bool = false

    enum SessionManagerKeys: String {
        case hasLoggedIn = "hasLoggedIn"
    }
}
