//
//  FWSingleLineViewModelDelegateMock.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 07/10/20.
//

import Foundation
@testable import Formworks

final class FWSingleLineViewModelDelegateMock: FWSingleLineViewModelDelegate {
	
	var didUpdateInterface: Bool = false
	
	func updateInterface() {
		didUpdateInterface = true
	}
	
}
