//
//  FWFormViewModel.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 07/10/20.
//

import Foundation

// MARK: Protocol-delegate
/// Responsible for providing a communication path
/// between the `FWFormViewModel` and its `View`.
protocol FWFormViewModelDelegate: AnyObject {
    /// Notifies the `View` that the setup is done.
    func didSetUp()
}

/// A representation of the `FWForm`'s `ViewModel`.
final class FWFormViewModel {
    // MARK: Properties
    /// The `FWComponent`'s `ViewModels` used to build each component.
    private var viewModels: [FWComponentViewModel] = [FWComponentViewModel]() {
        didSet {
            delegate?.didSetUp()
        }
    }

    /// The configuration used to create a form.
    private let configuration: FWConfiguration

    /// Responsible for providing a communication between the `FWFormViewModel`
    /// and its `View`.
    weak var delegate: FWFormViewModelDelegate?

    // MARK: Init
    /// Initializes a new instance of this type.
    /// - Parameter configuration: The configuration used to create a form.
    init(configuration: FWConfiguration) {
        self.configuration = configuration
        setUp()
    }

    /// The form's title.
    var title: String = ""

    /// The number of components on the form.
    var numberOfComponents: Int {
        return viewModels.count
    }

    /// The form's color style.
    var style: FWStyle = .light

    /// Returns the component's `ViewModel` for the given index.
    func viewModelAt(index: IndexPath) -> FWComponentViewModel {
        return viewModels[index.row]
    }

    /// Submits answers if every component is valid.
    func submit() -> Result<FWFormSnapshot, Error> {
        var formSnapshot = FWFormSnapshot(title: self.title, components: [])

        for index in 0..<viewModels.count {
            if viewModels[index].isValid {
                formSnapshot.components.append(viewModels[index].takeSnapshot())
            } else {
                return .failure(FWFormViewModelError.invalidFieldAt(IndexPath(row: index,section: 0)))
            }
        }

        return .success(formSnapshot)
    }


    /// Sets the form up using the `FWConfiguration` passed as a paremeter in the
    /// `FWFormViewModel` init.
    private func setUp() {
        let fwjson = FWJSON(data: configuration.json)

        fwjson.decode { [weak self] (result: Result<FWFormModel, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let form):
                var viewModels: [FWComponentViewModel] = []
                for component in form.components {
                    switch component.type {
                    case .text, .email, .numerical, .phonenumber:
                        if let textModel = component as? FWTextModel {
                            let viewModel = FWTextComponentViewModel(model:textModel)
                            viewModels.append(viewModel)
                        }
                    case .multiline:
                        if let textModel = component as? FWTextModel {
                            let viewModel = FWMultilineComponentViewModel(model:textModel)
                            viewModels.append(viewModel)
                        }
                    default:
                        break
                    }
                    self.title = form.title
                    self.style = .custom(form.style)
                    self.viewModels = viewModels
                }
            case .failure(_):
                break
                // TODO: Error Handling
            }
        }
    }
}
