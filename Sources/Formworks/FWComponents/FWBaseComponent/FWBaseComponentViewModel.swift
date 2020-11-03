//
//  FWBaseComponentViewModel.swift
//  
//
//  Created by Edgar Sgroi on 15/10/20.
//

import Foundation
protocol FWComponentViewModelDelegate: AnyObject {
	func updateUI()
}

protocol FWComponentViewModel {
	var title: String { get }
	var description: String { get }
	var errorMessage: String { get }
	var required: Bool { get }
	var validator: FWValidator { get }
	var componentType: FWComponentType { get }
	var isValid: Bool { get }
	func takeSnapshot() -> FWComponentSnapshot
}

class FWBaseComponentViewModel {
    let title: String
    let description: String
    let errorMessage: String
    let required: Bool
    let validator: FWValidator
	let componentType: FWComponentType
	var isValid: Bool = false {
		didSet {
			delegate?.updateUI()
		}
	}
    
	weak var delegate: FWComponentViewModelDelegate?
	
	init(title: String, description: String, errorMessage: String, required: Bool, validator: FWValidator, componentType: FWComponentType) {
        self.title = title
        self.description = description
        self.errorMessage = errorMessage
        self.required = required
        self.validator = validator
		self.componentType = componentType
    }
	
	func snapshot() -> FWComponentSnapshot {
		return FWComponentSnapshot(title: self.title, componentType: self.componentType.rawValue, required: self.required, content: "")
	}
	
	
}
