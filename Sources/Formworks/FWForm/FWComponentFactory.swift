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
    /// Type composed of a tuple of `FWSingleLineComponent` and `FWSingleLineViewModel`.
	private typealias FWComponent = (FWSingleLineComponent, FWSingleLineViewModel)
	
	private static func makeComponent() -> FWComponent {
		let viewModel = FWSingleLineViewModel()
		let viewController = FWSingleLineComponent(viewModel: viewModel)
		return (viewController, viewModel)
	}
	
    /// Used to make matching matrices of `FWSingleLineComponent` and `FWSingleLineViewModel`.
	static func makeComponents(_ amount: Int) -> FWComponents {
		var viewControllers = [FWSingleLineComponent]()
		var viewModels = [FWSingleLineViewModel]()
		
		for _ in 0..<amount {
			let component = makeComponent()
			viewControllers.append(component.0)
			viewModels.append(component.1)
		}
		return ([viewControllers], [viewModels])
	}
}
