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
        clipsToBounds = true
    }
}
