//
//  TabBar.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 72)
                        .foregroundColor(.clear)
                        .frame(width: scaled(80), height: scaled(55), alignment: .center)
                        .opacity(tab == selectedTab ? 1 : 0)
                        .animation(.easeInOut(duration: 0.1), value: selectedTab)
                    
                    VStack {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }) {
                            VStack {
                                Image(tab.image)
                                    .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                                    .frame(height: scaled(20))

                                Text(tab.title)
                                    .font(.blackOpsOneRegular(10))
                                    .foregroundColor(tab == selectedTab ? .themeBackground : .themeSelected)
                            }
                        }
                    }
                }
                .padding(.all, scaled(5))
            }
            
            Spacer()
        }
        .linearGradientBackground(colors: [Color.blue, Color.yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
        .cornerRadius(100, corners: .allCorners)
        .mask(RoundedRectangle(cornerRadius: 26, style: .continuous))
        .padding(.horizontal, scaled(24))
        .shadow(color: .themeShadow.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.equipment))
    }
}
