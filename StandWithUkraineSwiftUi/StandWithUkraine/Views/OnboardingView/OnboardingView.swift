//
//  OnboardingView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 23.08.2023.
//

import SwiftUI

struct OnboardingView: View {
    @State private var showSingIn = false
    
    var body: some View {
        ZStack {
            Color.themeGrey.ignoresSafeArea()
                .opacity(showSingIn ? 0.4 : 0)
            
            content
            
            if showSingIn {
                SignInView(show: $showSingIn)
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showSingIn = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: scaled(36), height: scaled(36))
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: .themeGrey.opacity(0.3), radius: 5, x: 0, y: 3)
                        }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                            .offset(y: showSingIn ? 0 : 200)
                    )
                    .transition(.opacity.combined(with: .move(edge: .top)))
                    .zIndex(1)
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: scaled(16)) {
            Text("Welcome!")
                .font(.blackOpsOneRegular(50))
            
            Text("We need to make sure that you support Ukraine in its struggle for independence. Click 'Sign In' button to pass the verification.")
                .font(.blackOpsOneRegular(20))
                .opacity(0.7)
            
            Spacer()
            
            Button(action: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    withAnimation(.spring()) {
                        showSingIn = true
                    }
                }
            }, label: {
                Label("Sign In", systemImage: "arrow.forward")
                    .offset(x: 4, y: 4)
                    .font(.blackOpsOneRegular(20))
            })
            .largeButton()
            .padding(.horizontal, scaled(24))
            .padding(.bottom, scaled(20))
            
            Text("This verification was created due to the fact that the developer really wants to get into the bootcamp and stand out among other applicants.")
                .font(.blackOpsOneRegular(17))
                .opacity(0.7)
        }
        .padding(scaled(40))
        .padding(.top, scaled(40))
        .background(MovingShapesView())
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
