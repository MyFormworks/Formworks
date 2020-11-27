//
//  DismissHFWDismissHeadereader.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 16/11/20.
//

import UIKit
final class FWDismissHeader: UITableViewHeaderFooterView {
	
	// MARK: Declarations
	@ManualLayout var button: UIButton
	@ManualLayout private var title: FWLabel
	
	static var identifier: String {
		return String(describing: self)
	}
	
	// MARK: Init
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		setupButtonConstraints()
		setupTitleConstraints()
		setHeaderButton()
	}

    @available(*, unavailable, message: "This class should only be instatiated with ViewCode.")
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	// MARK: Setup Button Constraints
	private func setupButtonConstraints() {
		self.contentView.addSubview(button)
		NSLayoutConstraint.activate([
			button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
			button.widthAnchor.constraint(equalToConstant: 75),
			button.heightAnchor.constraint(equalToConstant: 30),
			button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
	}
	
	// MARK: Setup Title Constraints
	private func setupTitleConstraints() {
		self.addSubview(title)
		NSLayoutConstraint.activate([
			title.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: 0),
			title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			title.bottomAnchor.constraint(equalTo:self.bottomAnchor),
			title.topAnchor.constraint(equalTo:self.topAnchor),
			title.heightAnchor.constraint(equalToConstant: 50)
		])
	}
	
	// MARK: Setup Header Image
	func setHeaderButton() {
		button.setTitle("Cancel", for: .normal)
		button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3).rounded().bold()
		button.setTitleColor(.fwAccent, for: .normal)
	}
	
	// MARK: Setup Header Title
	func setHeaderTitle(text: String) {
		title.font = UIFont.preferredFont(forTextStyle: .title3).rounded().bold()
		title.textColor = .fwComponentTitle
		title.numberOfLines = 0
		title.text = text
	}
}

