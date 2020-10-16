//
//  FWSingleLineViewModel.swift
//  
//
//  Created by Edgar Sgroi on 05/10/20.
//

import Foundation

/// The `FWSingleLine`'s  `ViewModel`.
final class FWSingleLineComponentViewModel: FWBaseComponentViewModel {
    var content: String = "" {
        didSet {
            isValid = validator.validate(content)
        }
    }
	
	override func snapshot() -> FWComponentSnapshot {
		return FWComponentSnapshot(title: self.title, componentType: self.componentType.rawValue, required: self.required, content: self.content)
	}
}
