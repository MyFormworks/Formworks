//
//  FWSingleLineComponent.swift
//  
//
//  Created by Artur Carneiro on 01/10/20.
//

import UIKit

final class FWSingleLineComponent: UIViewController {
	
	// MARK: Properties
	@ManualLayout private var textField: FWTextField
	
//	@ManualLayout private var titleLabel: FWLabel
//
//	@ManualLayout private var requiredLabel: FWLabel
//
//	@ManualLayout private var titleContainerView: UIView
//
//	@ManualLayout private var descriptionLabel: FWLabel
//
//	@ManualLayout private var errorLabel: FWLabel
//
//	@ManualLayout private var layoutStackView: UIStackView
	
	private let viewModel: FWSingleLineViewModel
	
	// MARK: Init
	init(viewModel: FWSingleLineViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setUpViewModel()
		setUpViews()
		setUpTitleContainer()
		setUpLayoutStack()
	}
	
	
	// MARK: ViewModel Setup
	private func setUpViewModel() {
		viewModel.delegate = self
		textField.delegate = self
	}
	
	// MARK: Views Setup
	private func setUpViews() {
		setUpHeader()
		setUpBody()
		setUpFooter()
		setUpStack()
	}
	
	private func setUpHeader() {
//		titleLabel.text = "One-line textfield One-line textfield One-line textfield One-line textfield"
//		titleLabel.style(.title)
//
//		requiredLabel.text = "Required"
//		requiredLabel.style(.required)
//
//		descriptionLabel.text = "Optional description for this field, Optional description for this field, Optional description for this field"
//		descriptionLabel.style(.description)
	}
	
	private func setUpBody() {
		textField.placeholder = "Write your one-line text here"
		textField.layer.borderColor = UIColor.systemRed.cgColor
		textField.delegate = self
	}
	
	private func setUpFooter() {
//		errorLabel.text = "If there are any errors with your input, it will appear here."
//		errorLabel.style(.error)
	}
	
	private func setUpStack() {
//		layoutStackView.axis = .vertical
//		layoutStackView.distribution = .fillEqually
	}
	
	// MARK: Layout Constraints
	private func setUpTitleContainer() {
//		titleContainerView.addSubview(titleLabel)
//		titleContainerView.addSubview(requiredLabel)
		
		NSLayoutConstraint.activate([
//			titleLabel.widthAnchor.constraint(equalTo: titleContainerView.widthAnchor,
//											  multiplier: ComponentSpec.SingleLine.titleWidthMultipler),
//			titleLabel.heightAnchor.constraint(equalTo: titleContainerView.heightAnchor),
//			titleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor),
//
//			requiredLabel.widthAnchor.constraint(equalTo: titleContainerView.widthAnchor,
//												 multiplier: ComponentSpec.SingleLine.requiredWidthMultiplier),
//			requiredLabel.heightAnchor.constraint(equalTo: titleContainerView.heightAnchor,
//												  multiplier: ComponentSpec.SingleLine.requiredHeightMultiplier),
//			requiredLabel.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor)
		])
	}
	
	private func setUpLayoutStack() {
//		layoutStackView.addArrangedSubview(titleContainerView)
//		layoutStackView.addArrangedSubview(descriptionLabel)
//		layoutStackView.addArrangedSubview(textField)
//		layoutStackView.addArrangedSubview(errorLabel)
//
		view.addSubview(textField)
		
		let layoutGuides = view.layoutMarginsGuide
		
		NSLayoutConstraint.activate([
			textField.centerXAnchor.constraint(equalTo: layoutGuides.centerXAnchor),
			textField.centerYAnchor.constraint(equalTo: layoutGuides.centerYAnchor),
			textField.widthAnchor.constraint(equalTo: layoutGuides.widthAnchor),
			textField.heightAnchor.constraint(equalTo: layoutGuides.heightAnchor)
		])
	}
	
}

// MARK: ViewModel Delegate
extension FWSingleLineComponent: FWSingleLineViewModelDelegate {
	func updateInterface() {
		print("Did update interface")
		if viewModel.isValid {
			textField.layer.borderColor = UIColor.systemGreen.cgColor
		} else {
			textField.layer.borderColor = UIColor.systemRed.cgColor
		}
	}
}

// MARK: Textfield Delegate
extension FWSingleLineComponent: UITextFieldDelegate {
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		let currentText = textField.text ?? ""
		guard let stringRange = Range(range, in: currentText) else { return false }
		let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
		viewModel.content = updatedText
		return true
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		print("End editing")
	}
	
}
