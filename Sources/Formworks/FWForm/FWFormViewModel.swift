//
//  FWFormViewModel.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 07/10/20.
//

import Foundation

protocol FWFormViewModelDelegate: AnyObject {
	func didReceiveComponents(_ components: [[FWSingleLineComponent]])
}

final class FWFormViewModel {
	
	private var viewModels: [[FWSingleLineViewModel]] = [[FWSingleLineViewModel]]()
	
	private let queue: DispatchQueue = DispatchQueue(label: "components-init")

	
	weak var delegate: FWFormViewModelDelegate?
	
	init() {
		
	}
	
	var numberOfComponents: Int {
		guard let section = viewModels.first else {
			return 0
		}
		return section.count
	}
	
	func build() {
		queue.async { [weak self] in
			guard let self = self else { return }
			let components = FWComponentFactory.makeComponents(5)
			self.viewModels = components.1
			self.delegate?.didReceiveComponents(components.0)
		}
		
	}
}
