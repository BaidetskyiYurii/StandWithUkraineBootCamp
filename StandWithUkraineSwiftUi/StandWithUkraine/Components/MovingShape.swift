//
//  MovingShape.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 25.08.2023.
//

import SwiftUI

struct MovingShape: View {
    var color: Color
    var startX: CGFloat
    var startY: CGFloat
    var endX: CGFloat
    var endY: CGFloat
    var animationDuration: Double
    
    @State private var currentX: CGFloat
    @State private var currentY: CGFloat
    
    init(color: Color, startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat, animationDuration: Double) {
        self.color = color
        self.startX = startX
        self.startY = startY
        self.endX = endX
        self.endY = endY
        self.animationDuration = animationDuration
        self._currentX = State(initialValue: startX)
        self._currentY = State(initialValue: startY)
    }
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: 200, height: 200)
            .offset(x: currentX, y: currentY)
            .onAppear() {
                withAnimation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: true)) {
                    currentX = endX
                    currentY = endY
                }
            }
    }
}

struct MovingShapesView: View {
    var body: some View {
        ZStack {
            MovingShape(color: .blue.opacity(0.6), startX: -350, startY: 50, endX: 450, endY: 500, animationDuration: 4.0)
            MovingShape(color: .yellow.opacity(0.6), startX: 100, startY: -650, endX: -100, endY: 550, animationDuration: 3.0)
            MovingShape(color: .pink.opacity(0.4), startX: 150, startY: -600, endX: -250, endY: 0, animationDuration: 5.0)
        }
        .blur(radius: 50)
    }
}

struct MovingShapesView_Previews: PreviewProvider {
    static var previews: some View {
        MovingShapesView()
    }
}
