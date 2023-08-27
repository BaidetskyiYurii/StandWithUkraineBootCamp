//
//  Alert + Extension.swift
//  StandWithUkraineUIKit
//
//  Created by Baidetskyi Jurii on 27.08.2023.
//
import UIKit

extension UIViewController {
    func showAlertWithOneButton(message: String, title: String = "", okActionHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: okActionHandler)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
