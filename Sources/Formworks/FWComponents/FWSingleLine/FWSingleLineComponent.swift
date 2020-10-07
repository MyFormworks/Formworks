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
	
	@ManualLayout private var titleLabel: FWLabel
	
	@ManualLayout private var requiredLabel: FWLabel
	
	@ManualLayout private var titleContainerView: UIView
	
	@ManualLayout private var descriptionLabel: FWLabel
	
	@ManualLayout private var errorLabel: FWLabel
	
	@ManualLayout private var layoutStackView: UIStackView
	
	private let viewModel: FWSingleLineViewModel
	
	// MARK: Init
	init(viewModel: FWSingleLineViewModel = FWSingleLineViewModel()) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setUpViews()
		setUpTitleContainer()
		setUpLayoutStack()
		setUpViewModel()
	}
	
	// MARK: @objc
	@objc private func didEnterCharacter(_ textfield: FWTextField) {
		viewModel.content = textfield.text ?? ""
	}
	
	// MARK: ViewModel Setup
	private func setUpViewModel() {
		viewModel.delegate = self
	}
	
	
	// MARK: Views Setup
	private func setUpViews() {
		setUpHeader()
		setUpBody()
		setUpFooter()
		setUpStack()
	}
	
	private func setUpHeader() {
		titleLabel.text = "One-line textfield One-line textfield One-line textfield One-line textfield"
		titleLabel.style(.title)
		
		requiredLabel.text = "Required"
		requiredLabel.style(.required)
		
		descriptionLabel.text = "Optional description for this field, Optional description for this field, Optional description for this field"
		descriptionLabel.style(.description)
	}
	
	private func setUpBody() {
		textField.placeholder = "Write your one-line text here"
		textField.layer.borderColor = UIColor.systemRed.cgColor
		textField.addTarget(self, action: #selector(didEnterCharacter(_:)), for: .editingChanged)
	}
	
	private func setUpFooter() {
		errorLabel.text = "If there are any errors with your input, it will appear here."
		errorLabel.style(.error)
	}
	
	private func setUpStack() {
		layoutStackView.axis = .vertical
		layoutStackView.distribution = .fillEqually
	}
	
	// MARK: Layout Constraints
	private func setUpTitleContainer() {
		titleContainerView.addSubview(titleLabel)
		titleContainerView.addSubview(requiredLabel)
		
		NSLayoutConstraint.activate([
			titleLabel.widthAnchor.constraint(equalTo: titleContainerView.widthAnchor,
											  multiplier: ComponentSpec.SingleLine.titleWidthMultipler),
			titleLabel.heightAnchor.constraint(equalTo: titleContainerView.heightAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor),
			
			requiredLabel.widthAnchor.constraint(equalTo: titleContainerView.widthAnchor,
												 multiplier: ComponentSpec.SingleLine.requiredWidthMultiplier),
			requiredLabel.heightAnchor.constraint(equalTo: titleContainerView.heightAnchor,
												  multiplier: ComponentSpec.SingleLine.requiredHeightMultiplier),
			requiredLabel.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor)
		])
	}
	
	private func setUpLayoutStack() {
		layoutStackView.addArrangedSubview(titleContainerView)
		layoutStackView.addArrangedSubview(descriptionLabel)
		layoutStackView.addArrangedSubview(textField)
		layoutStackView.addArrangedSubview(errorLabel)
		
		view.addSubview(layoutStackView)
		
		let layoutGuides = view.layoutMarginsGuide
		
		NSLayoutConstraint.activate([
			layoutStackView.centerXAnchor.constraint(equalTo: layoutGuides.centerXAnchor),
			layoutStackView.centerYAnchor.constraint(equalTo: layoutGuides.centerYAnchor),
			layoutStackView.widthAnchor.constraint(equalTo: layoutGuides.widthAnchor),
			layoutStackView.heightAnchor.constraint(equalTo: layoutGuides.heightAnchor)
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
