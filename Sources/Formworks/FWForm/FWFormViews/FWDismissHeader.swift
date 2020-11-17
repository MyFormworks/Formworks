//
//  DismissHFWDismissHeadereader.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 16/11/20.
//

import UIKit
final class FWDismissHeader: UITableViewHeaderFooterView {
	
	// MARK: Declarations
	@ManualLayout private var button: UIButton
	@ManualLayout private var title: UILabel
	
	static var id: String {
		return String(describing: self)
	}
	
	// MARK: Init
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		setupImageConstraints()
		setupTitleConstraints()
		self.contentView.backgroundColor = .white
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Setup Image Constraints
	private func setupImageConstraints() {
		contentView.addSubview(button)
		button.setTitleColor(.systemBlue, for: .normal)
		NSLayoutConstraint.activate([
			button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
			button.widthAnchor.constraint(equalToConstant: 75),
			button.heightAnchor.constraint(equalToConstant: 30),
			button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
		])
	}
	
	// MARK: Setup Title Constraints
	private func setupTitleConstraints() {
		contentView.addSubview(title)
		NSLayoutConstraint.activate([
			title.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width) - self.button.frame.width - 5),
			title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			title.bottomAnchor.constraint(equalTo:contentView.bottomAnchor),
			title.topAnchor.constraint(equalTo:contentView.topAnchor)
		])
	}
	
	// MARK: Setup Header Image
	func setHeaderImage(name: String) {
		button.setTitle("Cancel", for: .normal)
	}
	
	// MARK: Setup Header Title
	func setHeaderTitle(text: String) {
		title.text = text
	}
}

