//
//  ContentView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = .init()

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $viewModel.tabSelected) {
                EquipmentLossesView(router: MainRouter(isPresented: .constant(.none),
                                                       isTabViewShown: $viewModel.isTabViewShown))
                    .tag(Tab.equipment)
                PersonnelLossesView(router: MainRouter(isPresented: .constant(.none),
                                                       isTabViewShown: $viewModel.isTabViewShown))
                    .tag(Tab.personnel)
            }
            
            if viewModel.isTabViewShown {
                VStack {
                    Spacer()

                    withAnimation {
                        TabBar(selectedTab: $viewModel.tabSelected)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
