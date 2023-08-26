//
//  Router.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

struct NavigationState {
    var navigationPath: [ViewSpec] = []
    var presentingSheet: ViewSpec? = nil
    var presentingFullScreen: ViewSpec? = nil
    var presentingModal: ViewSpec? = nil
    var isPresented: Binding<ViewSpec?>
    
    var isPresenting: Bool {
        presentingSheet != nil || presentingFullScreen != nil || presentingModal != nil
    }
}

class Router: ObservableObject {
    @Published private(set) var state: NavigationState
    @Binding var isTabViewShown: Bool
    
    init(isPresented: Binding<ViewSpec?>,
         isTabViewShown: Binding<Bool>) {
        state = NavigationState(isPresented: isPresented)
        _isTabViewShown = isTabViewShown
    }
    
    func view(spec: ViewSpec, route: Route) -> AnyView {
        AnyView(EmptyView())
    }
}

extension Router {
    
    var navigationPath: Binding<[ViewSpec]> {
        binding(keyPath: \.navigationPath)
    }
    
    var presentingSheet: Binding<ViewSpec?> {
        binding(keyPath: \.presentingSheet)
    }
    
    var presentingFullScreen: Binding<ViewSpec?> {
        binding(keyPath: \.presentingFullScreen)
    }
    
    var presentingModal: Binding<ViewSpec?> {
        binding(keyPath: \.presentingModal)
    }
    
    var isPresented: Binding<ViewSpec?> {
        state.isPresented
    }
}

private extension Router {
    func binding<T>(keyPath: WritableKeyPath<NavigationState, T>) -> Binding<T> {
        Binding(
            get: { self.state[keyPath: keyPath] },
            set: { self.state[keyPath: keyPath] = $0 }
        )
    }
}

extension Router {
    
    func navigateTo(_ viewSpec: ViewSpec) {
        state.navigationPath.append(viewSpec)
    }
    
    func navigateBack() {
        state.navigationPath.removeLast()
    }
    
    func replaceNavigationStack(path: [ViewSpec]) {
        state.navigationPath = path
    }
    
    func presentSheet(_ viewSpec: ViewSpec) {
        state.presentingSheet = viewSpec
    }
    
    func presentFullScreen(_ viewSpec: ViewSpec) {
        state.presentingFullScreen = viewSpec
    }
    
    func presentModal(_ viewSpec: ViewSpec) {
        state.presentingModal = viewSpec
    }
    
    func dismiss() {
        if state.presentingSheet != nil {
            state.presentingSheet = nil
        } else if state.presentingFullScreen != nil {
            state.presentingFullScreen = nil
        } else if state.presentingModal != nil {
            state.presentingModal = nil
        } else if navigationPath.count > 1 {
            state.navigationPath.removeLast()
        } else {
            state.isPresented.wrappedValue = nil
        }
    }
}
