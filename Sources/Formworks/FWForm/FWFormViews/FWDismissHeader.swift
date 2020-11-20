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
	@ManualLayout private var title: UILabel
	
	static var id: String {
		return String(describing: self)
	}
	
	// MARK: Init
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		setupButtonConstraints()
		setupTitleConstraints()
//		self.backgroundColor = .white
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Setup Image Constraints
	private func setupButtonConstraints() {
		self.contentView.addSubview(button)
		button.setTitleColor(.systemBlue, for: .normal)
		NSLayoutConstraint.activate([
			button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
			button.widthAnchor.constraint(equalToConstant: 75),
			button.heightAnchor.constraint(equalToConstant: 30),
			button.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
		])
	}
	
	// MARK: Setup Title Constraints
	private func setupTitleConstraints() {
		self.addSubview(title)
		NSLayoutConstraint.activate([
			title.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width) - self.button.frame.width - 5),
			title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
			title.bottomAnchor.constraint(equalTo:self.bottomAnchor),
			title.topAnchor.constraint(equalTo:self.topAnchor)
		])
	}
	
	// MARK: Setup Header Image
	func setHeaderButton(name: String) {
		button.setTitle("Cancel", for: .normal)
	}
	
	// MARK: Setup Header Title
	func setHeaderTitle(text: String) {
		title.text = text
	}
	
	
}

