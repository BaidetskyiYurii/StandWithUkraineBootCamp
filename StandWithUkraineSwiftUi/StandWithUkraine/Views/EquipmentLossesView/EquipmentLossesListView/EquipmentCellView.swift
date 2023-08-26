//
//  EquipmentCellView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 23.08.2023.
//

import SwiftUI

struct EquipmentCellView: View {
    let item: EquipmentLossesModel
    
    var imagesArray = [
        "mother_motherland",
        "damaged_ tank",
        "army_soldiers",
        "men_uniform",
        "person_holding",
        "armored_tank",
        "low_angle",
        "young_woman",
        "portrait_soldier"
    ]
    
    var body: some View {
        HStack(spacing: scaled(5)) {
            
            VStack(alignment: .leading, spacing: scaled(5)) {
                Text("Day of heroic resistance: \(item.day)")
                    .font(.blackOpsOneRegular(15))
                    .fixedSize(horizontal: false, vertical: true)
                
                Divider()
                
                Text("Date: \(item.date)")
                    .font(.blackOpsOneRegular(10))
                    .fixedSize()
            }
            .padding(.trailing, scaled(20))
            
            Image(imagesArray.randomElement() ?? "damaged_ tank")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: scaled(51), height: scaled(48))
                .clipShape(CustomShapeView())
                .padding(.vertical, scaled(6))
                .scaleEffect(1.5)
        }
        .padding(scaled(20))
        .frame(maxWidth: .infinity, maxHeight: scaled(110))
        .foregroundColor(.white)
        .linearGradientBackgroundWithBlur(colors: [Color.blue, Color.yellow], startPoint: .topLeading, endPoint: .bottomTrailing, blurRadius: 15)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct HCard_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentCellView(item: EquipmentLossesModel.testModel)
    }
}
