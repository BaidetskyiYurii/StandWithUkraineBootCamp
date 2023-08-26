//
//  ResultAnimationView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 26.08.2023.
//

import SwiftUI

struct ResultAnimationView: View {
    @Binding var isSuccess: Bool
    @State private var animationCompleted = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: animationCompleted ? 1 : 0)
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                .foregroundColor(isSuccess ? .green : .red)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(animationCompleted ? 360 : 0))
                .animation(Animation.easeInOut(duration: 1.5), value: animationCompleted)
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        animationCompleted = true
                    })
                    
                }
            
            if animationCompleted && isSuccess {
                Image(systemName: "checkmark")
                    .resizable()
                    .foregroundColor(.green) 
                    .frame(width: 50, height: 50)
                    .animation(.easeInOut(duration: 0.5).delay(0.5), value: isSuccess)
            } else if animationCompleted && !isSuccess {
                Image(systemName: "xmark")
                    .resizable()
                    .foregroundColor(.red)
                    .frame(width: 50, height: 50)
                    .animation(.easeInOut(duration: 0.5).delay(0.5), value: isSuccess)
            }
        }
    }
}

struct SuccessAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ResultAnimationView(isSuccess: .constant(false))
    }
}
