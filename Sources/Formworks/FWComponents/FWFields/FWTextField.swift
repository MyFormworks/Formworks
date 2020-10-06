//
//  FWTextField.swift
//  
//
//  Created by Artur Carneiro on 02/10/20.
//

import UIKit

final class FWTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func style() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let width = bounds.width * 0.2
        
        return bounds.inset(by: UIEdgeInsets(top: 0, left: width, bottom: 0, right: width))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let width = bounds.width * 0.2
        
        return bounds.inset(by: UIEdgeInsets(top: 0, left: width, bottom: 0, right: width))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let width = bounds.width * 0.2
        
        return bounds.inset(by: UIEdgeInsets(top: 0, left: width, bottom: 0, right: width))
    }
}
