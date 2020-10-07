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
	
	weak var delegate: FWFormViewModelDelegate?
	
	init() {
		
	}
	
	var numberOfComponents: Int {
		return viewModels[0].count
	}
	
	func build() {
		let components = FWComponentFactory.makeComponents(5)
		viewModels = components.1
		delegate?.didReceiveComponents(components.0)
	}
}
