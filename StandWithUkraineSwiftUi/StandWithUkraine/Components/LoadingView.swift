//
//  LoadingView.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Spacer()
            
            VStack {
                Text("Loading..")

                ProgressView()
                    .scaleEffect(1.5)
                    .padding(.top, scaled(25))
            }
            .onAppear() {
                UIApplication.shared.endEditing()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
