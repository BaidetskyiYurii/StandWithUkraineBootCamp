//
//  String+Extensions.swift
//  StandWithUkraine
//
//  Created by Baidetskyi Jurii on 25.08.2023.
//

import Foundation

extension String {
    func formattedDate() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd.MM.yy"
            return outputFormatter.string(from: date)
        }
        
        return nil
    }
}
