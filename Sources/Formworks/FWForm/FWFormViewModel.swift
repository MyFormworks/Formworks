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
    func didReceiveComponents()
}

/// A representation of the `FWForm`'s `ViewModel`.
final class FWFormViewModel {
	
    private var viewModels: [[FWBaseComponentViewModel]] = [[FWBaseComponentViewModel]]()
	
    /// Should **only** be used to build `FWComponents`.
	private let queue: DispatchQueue = DispatchQueue(label: "components-init")
	
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

    func viewModelAt(index: IndexPath) -> FWBaseComponentViewModel {
        return viewModels[index.section][index.row]
    }

    private func generate(_ form: Data) {
        let fwjson = FWJSON(data: form)
        fwjson.decode { [weak self] (result: Result<FWFormData, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let formData):
                var viewModels: [FWBaseComponentViewModel] = []
                for component in formData.components {
                    let viewModel = FWSingleLineComponentViewModel(title: component.title,
                                                                   description: component.subtitle ?? "",
                                                                   errorMessage: component.errorMessage ?? "",
                                                                   required: component.required)
                    viewModels.append(viewModel)
                }
                self.viewModels.append(viewModels)
            case .failure(let error):
                // TODO: Handle user facing error
                print(error.localizedDescription)
            }
        }
    }
}
