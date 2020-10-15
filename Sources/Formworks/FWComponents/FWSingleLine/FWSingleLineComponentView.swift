//
//  FWSingleLineComponentView.swift
//  
//
//  Created by Artur Carneiro on 01/10/20.
//

import UIKit

/// A representation of a `Formworks` single line component.
final class FWSingleLineComponentView: FWBaseComponentView {
	
    @ManualLayout private var textField: FWTextField
    
    override func configure(with viewModel: FWBaseComponentViewModel) {
        if viewModel is FWSingleLineComponentViewModel {
            self.viewModel = viewModel
            layoutTextField()
//            layoutIfNeeded()
        }
    }
    
    private func layoutTextField() {
        specsView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalTo: specsView.widthAnchor),
            textField.centerXAnchor.constraint(equalTo: specsView.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: specsView.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
