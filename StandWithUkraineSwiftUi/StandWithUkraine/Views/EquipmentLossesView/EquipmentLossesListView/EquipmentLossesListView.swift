//
//  EquipmentLossesListView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

struct EquipmentLossesListView: View {
    @EnvironmentObject var router: MainRouter
    @ObservedObject var viewModel: EquipmentLossesViewModel
    
    init(viewModel: EquipmentLossesViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.militaryData) { item in
                    NavigationLink(value: ViewSpec.equipmentListItem(item: item),
                                   label: {
                        EquipmentCellView(item: item)
                            .padding(.horizontal, scaled(12))
                    })
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

struct EquipmentLossesListView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentLossesListView(viewModel: EquipmentLossesViewModel())
            .environmentObject(MainRouter(isPresented: .constant(.none), isTabViewShown: .constant(true)))
    }
}
