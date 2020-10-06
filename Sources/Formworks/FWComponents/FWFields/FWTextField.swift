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
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let width = bounds.width * 1.5
        let height = bounds.height
        let point = CGPoint(x: bounds.minX, y: bounds.minY)
        
        return CGRect(origin: point, size: CGSize(width: width, height: height))
    }
}
