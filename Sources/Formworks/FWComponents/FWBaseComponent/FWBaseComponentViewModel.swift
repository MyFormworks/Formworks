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

class FWBaseComponentViewModel {
    let title: String
    let description: String
    let errorMessage: String
    let required: Bool
    let validator: FWValidator
    var isValid: Bool = false
    
	weak var delegate: FWComponentViewModelDelegate?
	
    init(title: String, description: String, errorMessage: String, required: Bool, validator: FWValidator) {
        self.title = title
        self.description = description
        self.errorMessage = errorMessage
        self.required = required
        self.validator = validator
    }
}
