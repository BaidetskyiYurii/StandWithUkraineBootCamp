//
//  LargeButton.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 25.08.2023.
//

import SwiftUI

struct LargeButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .frame(maxWidth: .infinity)
            .linearGradientBackground(colors: [Color.blue, Color.yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
            .foregroundColor(.white)
            .mask(RoundedCorner(radius: 20, corners: [.topRight, .bottomLeft, .bottomRight]))
            .mask(RoundedRectangle(cornerRadius: 8))
            .shadow(color: .blue.opacity(0.5), radius: 20, x: 0, y: 10)
    }
}
