//
//  PersonnelLossesСellView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 24.08.2023.
//

import SwiftUI

struct PersonnelLossesСellView: View {
    let item: PersonnelLossesModel
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .center) {
                Spacer()
                
                if let formattedDateString = item.date.formattedDate() {
                    HStack {
                        Text("Since 24.02 -")
                            .font(.blackOpsOneRegular(20))
                            .foregroundColor(.black)
                        
                        Text(formattedDateString)
                            .font(.blackOpsOneRegular(20))
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, scaled(10))
                }
                
                
                Text("\(item.day) day of heroic resistance")
                    .lineLimit(1)
                    .fixedSize()
                    .font(.blackOpsOneRegular(15))
                    .foregroundColor(.black)
                    .padding(.bottom, scaled(10))
                
                
                LossesLabelView(itemLosses: item.personnel, itemName: "Occupiers attended Kobzon's concert")
                    .padding(.leading)
                
                Spacer()
            }
            .foregroundColor(.white)
            .padding(10)
            .linearGradientBackgroundWithBlur(colors: [Color.blue, Color.yellow], startPoint: .topLeading, endPoint: .bottomTrailing, blurRadius: 15)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .blue.opacity(0.3), radius: 8, x: 0, y: 12)
            .shadow(color: .yellow.opacity(0.3), radius: 2, x: 0, y: 1)
            
            Spacer()
            
        }
        .padding(.horizontal)
    }
}

struct PersonnelLossesСellView_Previews: PreviewProvider {
    static var previews: some View {
        PersonnelLossesСellView(item: PersonnelLossesModel.testModel)
    }
}
