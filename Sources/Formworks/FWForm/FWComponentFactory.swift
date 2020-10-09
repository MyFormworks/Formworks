//
//  FWComponentFactory.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 07/10/20.
//

import Foundation

/// Type of a group of `FWComponent` composed of a matrix of `FWSingleLineComponent` and a matrix of `FWSingleLineViewModel`.
typealias FWComponents = ([[FWSingleLineComponent]], [[FWSingleLineViewModel]])

/// Factory responsioble for building `FWComponents`.
enum FWComponentFactory {
    /// Used to make matching matrices of `FWSingleLineComponent` and `FWSingleLineViewModel`.
	static func makeComponents(_ components: [FWComponentData]) -> FWComponents {
		var viewControllers = [FWSingleLineComponent]()
		var viewModels = [FWSingleLineViewModel]()
		
		for component in components {
            let validator = self.checkValidator(for: component)
            let viewModel = FWSingleLineViewModel(validator)
			let viewController = FWSingleLineComponent(viewModel: viewModel)
			viewControllers.append(viewController)
			viewModels.append(viewModel)
		}
		return ([viewControllers], [viewModels])
	}

    private static func checkValidator(for componentData: FWComponentData) -> FWValidator {
        switch componentData.specs {
        case is FWEmailSpecs:
            return FWValidator.email
        case is FWDigitsSpecs:
            return FWValidator.cellphone
        default:
            return FWValidator.max32
        }
    }
}
