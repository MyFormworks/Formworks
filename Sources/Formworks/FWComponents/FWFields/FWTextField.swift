//
//  FWTextField.swift
//  
//
//  Created by Artur Carneiro on 02/10/20.
//

import UIKit

/// A representation of a `Formworks` text field.
final class FWTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func style() {
        backgroundColor = .fwComponentInputBackground
        tintColor = .fwComponentInputText
        textColor = .fwComponentInputText
        borderStyle = .roundedRect
        autocapitalizationType = .none
    }
    
    /// Defines the width rect size of the text rect.
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let width = bounds.width * 0.05
        
        return bounds.inset(by: UIEdgeInsets(top: 0, left: width, bottom: 0, right: width))
    }
    
    /// Defines the placeholder rect size of the text rect.
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let width = bounds.width * 0.05
        
        return bounds.inset(by: UIEdgeInsets(top: 0, left: width, bottom: 0, right: width))
    }
    
    /// Defines the editing rect size of the text rect.
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let width = bounds.width * 0.05
        
        return bounds.inset(by: UIEdgeInsets(top: 0, left: width, bottom: 0, right: width))
    }
}
