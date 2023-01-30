//
//  UIViewController+Keyboard.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import Foundation
import UIKit

extension UIViewController {

    // MARK: - Public Methods

    func hideKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        view.addGestureRecognizer(tap)
    }

}

// MARK: - Private Methods

@objc
private extension UIViewController {

    func dismissKeyboard() {
        view.endEditing(true)
    }

}
