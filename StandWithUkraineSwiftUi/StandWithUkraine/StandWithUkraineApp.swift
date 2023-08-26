//
//  StandWithUkraineApp.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

@main
struct StandWithUkraineApp: App {
    @StateObject var sessionManager: SessionManager = .init()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(sessionManager)
        }
    }
}
