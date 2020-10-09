//
//  FWFormViewModel.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 07/10/20.
//

import Foundation

/// Delegate responsible to binding the `FWFormViewModel`
/// with a `View`.
protocol FWFormViewModelDelegate: AnyObject {
	func didReceiveComponents(_ components: [[FWSingleLineComponent]])
}

/// A representation of the `FWForm`'s `ViewModel`.
final class FWFormViewModel {
	
	private var viewModels: [[FWSingleLineViewModel]] = [[FWSingleLineViewModel]]()
	
    /// Should **only** be used to build `FWComponents`.
	private let queue: DispatchQueue = DispatchQueue(label: "components-init")

    private var data: FWFormData?

	
	weak var delegate: FWFormViewModelDelegate?
	
    init(_ json: Data) {
        generate(json)
    }
	
	var numberOfComponents: Int {
		guard let section = viewModels.first else {
			return 0
		}
		return section.count
	}
	
    /// Builds the `FWComponents` required by the `FWForm`.
	func build() {
		queue.async { [weak self] in
			guard let self = self else { return }
            guard let form = self.data else { return }
            let components = FWComponentFactory.makeComponents(form.components)

            self.viewModels = components.1
            self.delegate?.didReceiveComponents(components.0)
		}
		
	}

    private func generate(_ form: Data) {
        let fwjson = FWJSON(data: form)
        fwjson.decode { [weak self] (result: Result<FWFormData, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let formData):
                self.data = formData
            case .failure(let error):
                // TODO: Handle user facing error
                print(error.localizedDescription)
            }
        }
    }
}
