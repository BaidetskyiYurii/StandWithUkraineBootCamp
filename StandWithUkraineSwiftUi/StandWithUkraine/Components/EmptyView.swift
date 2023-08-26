//
//  EmptyView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "doc.text.magnifyingglass")
                .resizable()
            
            text
                .padding(.bottom, scaled(150))
            
            Spacer()
        }
        .padding(.horizontal,scaled(24))
        .background(MovingShapesView())
    }
    
    private var text: some View {
        VStack(alignment: .center, spacing: scaled(25)) {
            VStack {
                Text("Ooops, something went wrong...")
                Text("Please, try again later 😘")
            }
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
