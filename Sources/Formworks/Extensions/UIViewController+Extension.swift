//
//  UIViewController+Extension.swift
//  SampleMacro
//
//  Created by Rafael Galdino on 18/11/20.
//

import UIKit

extension UIViewController {
    /// Adds a tap gesture recognizer to the view to dismiss the keyboard.
    func addKeyboardDismissal() {
        let tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tapRecognizer)
    }

    /// Objective-C function that dismisses the keyboard.
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
