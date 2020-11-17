//
//  FWFooter.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 16/11/20.
//

import UIKit

final class FWFooter: UITableViewHeaderFooterView {
	@ManualLayout private var submit: UIButton
	
	static var id: String {
		return String(describing: self)
	}
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		setUpConstrains ()
		setupAttributes()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setUpConstrains () {
		contentView.addSubview(submit)
		NSLayoutConstraint.activate([
			submit.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			submit.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			submit.heightAnchor.constraint(equalToConstant: 45),
			submit.widthAnchor.constraint(equalToConstant: 100)
		])
	}
	
	func setupAttributes() {
		submit.setTitle("Submit", for: .normal)
		submit.setTitleColor(.fwComponentBackground, for: .normal)
		submit.backgroundColor = .fwAccent
		self.contentView.backgroundColor = .white
	}
}
