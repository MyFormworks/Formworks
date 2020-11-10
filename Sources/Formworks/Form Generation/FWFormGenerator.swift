//
//  FWFormGenerator.swift
//  
//
//  Created by Artur Carneiro on 10/11/20.
//

import UIKit

public enum FWFormGeneratorError: Error {
    case invalidSetup
    case failedToSetUp
}

public final class FWFormGenerator: FormGenerator {

    private let configuration: FWConfiguration

    private var formViewModel: FWFormViewModel?

    public init(configuration: FWConfiguration) {
        self.configuration = configuration
    }

    
    /// It will decode the data provided through a JSON and with the decoded data
    /// it will generate the `FWFormViewModel` that will be used in the `FWFormViewController`.
    /// - Parameter completion: When it fails the completion, it will provide a error. Otherwise, it returns nothing.
    public func setUp(completion: @escaping (Error?) -> Void) {
        let fwjson = FWJSON(data: configuration.json)

        fwjson.decode { [weak self] (result: Result<FWFormModel, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let form):
                UIColor.style = .custom(form.style)
                var viewModels: [FWComponentViewModel] = []
                for component in form.components {
                    switch component {
                    case is FWTextModel:
                        if let textModel = component as? FWTextModel {
                            let viewModel = FWTextComponentViewModel(model:textModel)
                            viewModels.append(viewModel)
                        }
                    default:
                        break
                    }
                    let formViewModel = FWFormViewModel(viewModels: viewModels,
                                                        title: form.title,
                                                        generator: self)
                    self.formViewModel = formViewModel
                }
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    
    /// It will create a `FWFormViewController` based on a provided ViewModel as a sucessful case for the completion handler.
    /// - Parameter completion: If sucessful it will provide a `FWFormViewController` as a result; If failed, it will provide an error as result.
    public func generate(completion: (Result<FWFormViewController, Error>) -> Void) {
        guard let formViewModel = formViewModel else {
            completion(.failure(FWFormGeneratorError.invalidSetup))
        }

        let formViewController = FWFormViewController(viewModel: formViewModel)
        completion(.success(formViewController))
    }

    func receive(_ answers: FWFormSnapshot) {
        <#code#>
    }


}
