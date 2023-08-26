//
//  EquipmentLossesView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

struct EquipmentLossesView: View {
    @StateObject var mainRouter: MainRouter
    @StateObject var viewModel: EquipmentLossesViewModel
    
    init(router: MainRouter) {
        self._mainRouter = StateObject(wrappedValue: router)
        self._viewModel = StateObject(wrappedValue: EquipmentLossesViewModel())
    }
    
    var body: some View {
        RoutingView(router: mainRouter) {
            content
                .navigationTitle("Equipment Losses")
                .navigationBarTitleDisplayMode(.large)
                .toolbarBackground(Color.clear, for: .navigationBar)
        }
        .environmentObject(mainRouter)
    }
    
    var content: some View {
        ZStack {
            switch viewModel.dataManager.viewState {
            case .loading:
                LoadingView()
            case .empty:
                EmptyView()
            case .content:
                EquipmentLossesListView(viewModel: viewModel)
            }
        }
    }
}

struct EquipmentLossesView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentLossesView(router: MainRouter(isPresented: .constant(.none),
                                               isTabViewShown: .constant(true)))
    }
}
