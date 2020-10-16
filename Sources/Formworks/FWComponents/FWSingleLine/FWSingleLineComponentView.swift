//
//  FWSingleLineComponentView.swift
//  
//
//  Created by Artur Carneiro on 01/10/20.
//

import UIKit

/// A representation of a `Formworks` single line component.
final class FWSingleLineComponentView: FWBaseComponentView {
	// MARK: Properties
    @ManualLayout private var textField: FWTextField
    
    override func configure(with viewModel: FWBaseComponentViewModel) {
        if viewModel is FWSingleLineComponentViewModel {
            layoutTextField()
			viewModel.delegate = self
            self.viewModel = viewModel
			
        }
    }
	
	// MARK: @objc
	@objc func didEdit(_ textfield: FWTextField) {
		guard let viewModel = self.viewModel as? FWSingleLineComponentViewModel else { return }
		viewModel.content = textfield.text ?? ""
	}
	
	// MARK: Setup
	private func setUpTextField() {
		textField.addTarget(self, action: #selector(didEdit(_:)), for: .editingChanged)
	}
	
	// MARK: Layout
    private func layoutTextField() {
        specsView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalTo: specsView.widthAnchor),
            textField.centerXAnchor.constraint(equalTo: specsView.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: specsView.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: ComponentSpec.SingleLine.textFieldHeight)
        ])
    }
}

extension FWSingleLineComponentView: FWComponentViewModelDelegate {
	func updateUI() {
		guard let viewModel = viewModel else { return }
		if viewModel.isValid {
			textField.textColor = .green
		}
	}
	
	
}
