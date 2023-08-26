//
//  SessionManager.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 23.08.2023.
//
import SwiftUI

final class SessionManager: ObservableObject {
    @Published var currentState: CurrentState? = .loggedOut
    @ObservedObject var userDefaultsManager: UserDefaultsManager = .shared
    
    enum CurrentState: Equatable {
        case loggedIn
        case loggedOut
    }
    
    func signIn() {
        userDefaultsManager.hasLoggedIn = true
        currentState = .loggedIn
    }
    
    func logOut() {
        userDefaultsManager.hasLoggedIn = false
        currentState = .loggedOut
    }
    
    func configureCurrentState() {
        currentState = userDefaultsManager.hasLoggedIn ? .loggedIn : .loggedOut
    }
}
