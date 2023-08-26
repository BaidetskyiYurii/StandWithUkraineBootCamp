//
//  EquipmentLossesItemView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

struct EquipmentLossesItemView: View {
    @EnvironmentObject var router: MainRouter
    @StateObject var viewModel: EquipmentLossesItemViewModel
    
    init(item: EquipmentLossesModel) {
        _viewModel = StateObject(wrappedValue: EquipmentLossesItemViewModel(item: item))
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .center) {
                Spacer()
                
                if let formattedDateString = viewModel.item.date.formattedDate() {
                    HStack {
                        Text("Since 24.02 -")
                            .font(.blackOpsOneRegular(20))
                            .foregroundColor(.yellow)
                        
                        Text(formattedDateString)
                            .font(.blackOpsOneRegular(20))
                            .foregroundColor(.yellow)
                    }
                    .padding(.bottom, scaled(10))
                }
                
                Text("\(viewModel.item.day) day of heroic resistance")
                    .lineLimit(1)
                    .fixedSize()
                    .font(.blackOpsOneRegular(15))
                    .foregroundColor(.yellow)
                    .padding(.bottom, scaled(10))
                
                VStack(spacing: scaled(2)) {
                    ForEach(viewModel.labelDefinitions, id: \.itemName) { definition in
                        LossesLabelView(itemLosses: definition.itemLosses, itemName: definition.itemName)
                    }
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            .padding(10)
            .frame(width: scaled(375), height: scaled(650))
            .background(.linearGradient(colors: [.blue.opacity(1), .yellow.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .blue.opacity(0.3), radius: 8, x: 0, y: 12)
            .shadow(color: .yellow.opacity(0.3), radius: 2, x: 0, y: 1)
            
            Spacer()
            
        }
        .onAppear(perform: {
            router.isTabViewShown = false
        })
        .background(MovingShapesView())
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    private var backButton: some View {
        NavigationBarBackButton(action: {
            router.navigateBack()
            router.replaceNavigationStack(path: [])
            router.isTabViewShown = true
        })
    }
}

struct EquipmentLossesItemView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentLossesItemView(item: EquipmentLossesModel.testModel)
            .environmentObject(MainRouter(isPresented: .constant(.equipmentListItem(item: EquipmentLossesModel.testModel)), isTabViewShown: .constant(false)))
    }
}
