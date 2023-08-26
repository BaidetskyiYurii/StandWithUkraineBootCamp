//
//  CGSize+Extension.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 22.08.2023.
//

import CoreGraphics

extension CGSize {
    var hypot: CGFloat {
        CoreGraphics.hypot(width, height)
    }
}
