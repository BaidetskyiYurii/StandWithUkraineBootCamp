//
//  NavigationBarBackButton.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

struct NavigationBarBackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
                .foregroundColor(.yellow)
        }
    }
}

struct NavigationBarBackButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarBackButton(action: {})
    }
}
