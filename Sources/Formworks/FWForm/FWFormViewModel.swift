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
    func didSubmit(_ result: Result<Data, Error>)
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

    var title: String = ""

    var numberOfComponents: Int {
        guard let section = viewModels.first else {
            return 0
        }
        return section.count
    }

    func viewModelAt(index: IndexPath) -> FWBaseComponentViewModel {
        return viewModels[index.section][index.row]
    }

    func submit() {
        var formSnapshot = FWFormSnapshot(title: self.title, components: [])
        guard let viewModels = viewModels.first else {
            return
        }
        for viewModel in viewModels {
            if viewModel.isValid {
                formSnapshot.components.append(viewModel.snapshot())
            } else {
                #warning("Missing error propagation")
            }
        }
        do {
            let encoded = try JSONEncoder().encode(formSnapshot)
            delegate?.didSubmit(.success(encoded))
        } catch {
            delegate?.didSubmit(.failure(error))
        }
    }

    private func generate(_ form: Data) {
        let fwjson = FWJSON(data: form)
        fwjson.decode { [weak self] (result: Result<FWFormModel, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let formData):
                self.title = formData.title
                var viewModels: [FWBaseComponentViewModel] = []
                for component in formData.components {
                    switch type(of: component){
                    case is FWTextModel:
                        let viewModel = FWSingleLineComponentViewModel(title: component.title,
                                                                       description: component.description,
                                                                       errorMessage:  "",
                                                                       required: component.required,
                                                                       validator: .max32,
                                                                       componentType: "text")
                        viewModels.append(viewModel)
                    default:
                        continue
                    }
                }
                self.viewModels.append(viewModels)
                self.delegate?.didReceiveComponents()
            case .failure(let error):
                // TODO: Handle user facing error
                print(error.localizedDescription)
            }
        }
    }
}
