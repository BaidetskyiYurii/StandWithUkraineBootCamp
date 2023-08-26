//
//  View+Extensions.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

let idealSize = CGSize(width: 375, height: 812)
let screenSize: CGSize = UIScreen.main.bounds.size

var scale: CGFloat {
    return min(1, screenSize.hypot / idealSize.hypot, 1)
}

func scaled(_ constant: CGFloat) -> CGFloat {
    return constant * scale
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        return clipShape( RoundedCorner(radius: radius, corners: corners))
    }
}

extension View {
    func linearGradientBackground(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint) -> some View {
        self.background(LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint))
    }
}

extension View {
    func linearGradientBackgroundWithBlur(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint, blurRadius: CGFloat) -> some View {
        self.background(
            LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
                .blur(radius: blurRadius)
        )
    }
}

extension View {
    func customTextField() -> some View {
        modifier(CustomTextField())
    }
    
    func largeButton() -> some View {
        modifier(LargeButton())
    }
}
