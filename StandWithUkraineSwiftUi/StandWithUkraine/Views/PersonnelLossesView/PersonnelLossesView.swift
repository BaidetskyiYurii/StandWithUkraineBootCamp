//
//  PersonnelLossesView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

struct PersonnelLossesView: View {
    @StateObject var mainRouter: MainRouter
    @StateObject var viewModel: PersonnelLossesViewModel
    
    init(router: MainRouter) {
        self._mainRouter = StateObject(wrappedValue: router)
        self._viewModel = StateObject(wrappedValue: PersonnelLossesViewModel())
    }
    
    var body: some View {
        RoutingView(router: mainRouter) {
            content
                .navigationTitle("Personnel Losses")
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
                PersonnelLossesListView(viewModel: viewModel)
            }
        }
    }
}

struct PersonnelLossesView_Previews: PreviewProvider {
    static var previews: some View {
        PersonnelLossesView(router: MainRouter(isPresented: .constant(.none),
                                               isTabViewShown: .constant(true)))
    }
}
