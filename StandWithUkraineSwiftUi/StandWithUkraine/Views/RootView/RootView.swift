//
//  RootView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 23.08.2023.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        ZStack {
            switch sessionManager.currentState {
            case .loggedIn:
                HomeView()
            case .loggedOut:
                OnboardingView()
            default:
                Color.themeBackground.ignoresSafeArea()
            }
        }
        .onAppear(perform: {
            sessionManager.configureCurrentState()
        })
        .navigationViewStyle(.stack)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(SessionManager())
    }
}
