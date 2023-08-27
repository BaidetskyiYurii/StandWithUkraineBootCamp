//
//  SignInView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 23.08.2023.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @StateObject var viewModel: SignInViewModel = .init()
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Sign in")
                .font(.blackOpsOneRegular(20))
            
            VStack(spacing: scaled(10)) {
                Text("Just choose correct answer")
                    .font(.blackOpsOneRegular(20))
                    .fixedSize()
                
                HStack {
                    Text("Do you support")
                        .font(.blackOpsOneRegular(20))
                        .foregroundColor(.blue)
                    
                    Text("Ukraine?")
                        .font(.blackOpsOneRegular(20))
                        .foregroundColor(.yellow)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Your Answer")
                    .font(.blackOpsOneRegular(15))
                
                Button {
                    viewModel.logIn(isRightChoice: true) {
                        show.toggle()
                        sessionManager.signIn()
                    }
                } label: {
                    HStack {
                        Text("Yes, of course!")
                            .font(.blackOpsOneRegular(20))
                    }
                    .largeButton()
                }
                
                Button {
                    viewModel.logIn(isRightChoice: false) {
                        show.toggle()
                    }
                } label: {
                    HStack {
                        Text("No, I do not")
                            .foregroundColor(.themeShadow)
                            .font(.blackOpsOneRegular(20))
                    }
                    .largeButton()
                    
                }
            }
        }
        .padding(scaled(30))
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .themeGrey.opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: .themeGrey.opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .overlay(
            ZStack {
                if viewModel.isLoading {
                    ResultAnimationView(isSuccess: $viewModel.isSuccess)
                }
            }
        )
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(show: .constant(true))
            .environmentObject(SessionManager())
    }
}
