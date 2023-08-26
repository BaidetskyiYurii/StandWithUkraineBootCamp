//
//  LossesLabelView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 23.08.2023.
//

import SwiftUI

struct LossesLabelView: View {
    let itemLosses: Int
    let itemName: String
    
    var body: some View {
        HStack {
            Text("\(itemLosses)")
                .font(.blackOpsOneRegular(30))
                .foregroundColor(.yellow)
                .frame(width: scaled(125))
            
            Text(itemName)
                .font(.blackOpsOneRegular(15))
                .foregroundColor(.themeSelected)
                .padding(.bottom, scaled(10))
            
            Spacer()
        }
        .padding(.horizontal, scaled(10))
    }
}

struct LossesLabelView_Previews: PreviewProvider {
    static var previews: some View {
        LossesLabelView(itemLosses: 1, itemName: "Tanks")
    }
}
