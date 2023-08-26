//
//  PersonnelLossesListView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

struct PersonnelLossesListView: View {
    @EnvironmentObject var router: MainRouter
    @ObservedObject var viewModel: PersonnelLossesViewModel
    
    init(viewModel: PersonnelLossesViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.militaryData) { item in
                    PersonnelLossesСellView(item: item)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
            }
            .onAppear {
                router.isTabViewShown = true
            }
        }
        .background(MovingShapesView())
    }
}

struct PersonnelLossesListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonnelLossesListView(viewModel: PersonnelLossesViewModel())
            .environmentObject(MainRouter(isPresented: .constant(.none), isTabViewShown: .constant(true)))
    }
}
