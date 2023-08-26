//
//  RootViewModel.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var isTabViewShown = true
    @Published var tabSelected: Tab = .equipment
}

