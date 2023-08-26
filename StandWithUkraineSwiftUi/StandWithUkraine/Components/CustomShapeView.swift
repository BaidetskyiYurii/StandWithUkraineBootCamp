//
//  CustomShapeView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

struct CustomShapeView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 38.1189, y: 0.383419))
        path.addCurve(to: CGPoint(x: 45.1212, y: 14.7475),
                      control1: CGPoint(x: 43.0131, y: 2.29666),
                      control2: CGPoint(x: 42.9497, y: 9.72543))
        path.addCurve(to: CGPoint(x: 50.9655, y: 30.095),
                      control1: CGPoint(x: 47.3441, y: 19.8888),
                      control2: CGPoint(x: 51.4158, y: 24.4608))
        path.addCurve(to: CGPoint(x: 42.6922, y: 45.1427),
                      control1: CGPoint(x: 50.9655, y: 36.0231),
                      control2: CGPoint(x: 47.2761, y: 41.7011))
        path.addCurve(to: CGPoint(x: 27.2164, y: 47.9262),
                      control1: CGPoint(x: 38.317, y: 48.4276),
                      control2: CGPoint(x: 32.5798, y: 47.8589))
        path.addCurve(to: CGPoint(x: 13.1133, y: 45.5139),
                      control1: CGPoint(x: 22.3353, y: 47.9874),
                      control2: CGPoint(x: 17.0862, y: 48.5166))
        path.addCurve(to: CGPoint(x: 6.78391, y: 32.4835),
                      control1: CGPoint(x: 9.2643, y: 42.6049),
                      control2: CGPoint(x: 8.91113, y: 36.9551))
        path.addCurve(to: CGPoint(x: 0.154321, y: 18.2733),
                      control1: CGPoint(x: 4.48296, y: 27.6468),
                      control2: CGPoint(x: -0.985107, y: 23.5528))
        path.addCurve(to: CGPoint(x: 11.9593, y: 8.50392),
                      control1: CGPoint(x: 1.29474, y: 12.9893),
                      control2: CGPoint(x: 7.36184, y: 10.8893))
        path.addCurve(to: CGPoint(x: 23.3515, y: 6.23727),
                      control1: CGPoint(x: 15.5159, y: 6.65853),
                      control2: CGPoint(x: 19.5507, y: 7.41712))
        path.addCurve(to: CGPoint(x: 38.1189, y: 0.383419),
                      control1: CGPoint(x: 28.5219, y: 4.63227),
                      control2: CGPoint(x: 33.0644, y: -1.5925))
        path.closeSubpath()
        return path
    }
}

struct CustomShapeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeView()
    }
}
