//
//  MainRouter.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

class MainRouter: Router {
    func openEquipmentItem(item: EquipmentLossesModel) {
        navigateTo(.equipmentListItem(item: item))
    }
    
    override func view(spec: ViewSpec, route: Route) -> AnyView {
        AnyView(buildView(spec: spec, route: route))
    }
}

private extension MainRouter {
    
    @ViewBuilder
    func buildView(spec: ViewSpec, route: Route) -> some View {
        switch spec {
        case .equipmentListItem(let item):
            EquipmentLossesItemView(item: item)
        }
    }
            
    func router(route: Route) -> MainRouter {
        switch route {
        case .navigation:
            return self
        case .sheet:
            return MainRouter(isPresented: presentingSheet, isTabViewShown: .constant(false))
        case .fullScreenCover:
            return MainRouter(isPresented: presentingFullScreen, isTabViewShown: .constant(false))
        case .modal:
            return self
        }
    }
}
