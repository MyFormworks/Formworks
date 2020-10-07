//
//  FWComponentFactory.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 07/10/20.
//

import Foundation

typealias FWComponents = ([[FWSingleLineComponent]], [[FWSingleLineViewModel]])

enum FWComponentFactory {
	private typealias FWComponent = (FWSingleLineComponent, FWSingleLineViewModel)
	
	private static func makeComponent() -> FWComponent {
		let viewModel = FWSingleLineViewModel()
		let viewController = FWSingleLineComponent(viewModel: viewModel)
		return (viewController, viewModel)
	}
	
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
