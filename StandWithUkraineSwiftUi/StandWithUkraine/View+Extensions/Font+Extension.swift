//
//  Font+Extension.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 23.08.2023.
//

import SwiftUI

extension Font {
    // MARK: - black Ops One font
    
    static func blackOpsOneRegular(_ size: CGFloat) -> Font {
        .custom("BlackOpsOne-Regular", size: scaled(size))
    }
}

   // MARK: - Scaling

extension Font {
    static var scale: CGFloat {
        return min(1, screenSize.hypot / idealSize.hypot, 1)
    }
    
    static func scaled(_ constant: CGFloat) -> CGFloat {
        return constant * scale
    }
}

struct fonts_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 15) {
            Text("Some text example regular 20!")
                .font(.blackOpsOneRegular(20))
            
            Text("Some text example regular 30!")
                .font(.blackOpsOneRegular(30))
            
            Text("Some text example regular 40!")
                .font(.blackOpsOneRegular(40))
        }
        .padding(10)
    }
}

