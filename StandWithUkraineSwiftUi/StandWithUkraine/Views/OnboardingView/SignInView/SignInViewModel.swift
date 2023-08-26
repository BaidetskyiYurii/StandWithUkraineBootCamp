//
//  SignInViewModel.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 25.08.2023.
//

import SwiftUI

final class SignInViewModel: ObservableObject {
    @Published var answer = ""
    @Published var isLoading = false
    @Published var isSuccess = false
    
    func logIn(completion: (() -> ())? = nil) {
        isLoading = true
        
        if answer.capitalized == "Glory To Heroes" {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                isSuccess = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    completion?()
                }
            }
        } else {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                isSuccess = false
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
                guard let self else { return }
                self.isLoading = false
            }
        }
    }
}
