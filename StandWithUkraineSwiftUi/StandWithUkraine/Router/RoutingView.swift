//
//  RoutingView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

struct RoutingView<Content: View>: View {
    @EnvironmentObject var sessionManager: SessionManager
    @StateObject var router: Router
    private let content: Content
    
    init(router: Router, @ViewBuilder content: @escaping () -> Content) {
        _router = StateObject(wrappedValue: router)
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: router.navigationPath) {
            content
                .navigationBarItems(trailing: logoutButton)
                .navigationDestination(for: ViewSpec.self) { spec in
                    router.view(spec: spec, route: .navigation)
                }
        }
        .sheet(item: router.presentingSheet) { spec in
            router.view(spec: spec, route: .sheet)
        }
        .fullScreenCover(item: router.presentingFullScreen) { spec in
            router.view(spec: spec, route: .fullScreenCover)
        }
    }
    
    private var logoutButton: some View {
        Button(action: {
            withAnimation {
                sessionManager.logOut()
            }
        }) {
            Text("Log Out")
                .font(.blackOpsOneRegular(15))
                .foregroundColor(.white)
                .padding(.all, scaled(5))
        }
        .linearGradientBackground(colors: [Color.blue, Color.yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
