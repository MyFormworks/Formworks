//
//  FWTextComponentViewModel.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 09/11/20.
//

import Foundation

// MARK: Protocol-Delegate

/// Protocol specifying what methods should be implemented when using `FWTextComponentViewModel`.
protocol FWTextComponentViewModelDelegate: AnyObject {
    func update()
}

/// Object responsible for handling all the data handling and business logic of the `FWTextComponentView`.
final class FWTextComponentViewModel: FWComponentViewModel {
    // MARK: Properties
    
    /// View responsible for receiving the method calls of the ViewModel.
    weak var delegate: FWTextComponentViewModelDelegate?
    
    private let validator: FWRegexValidator
    private let model: FWTextModel
    
    // MARK: Init
    
    /// Initializes viewModel for `FWTextComponentView`.
    /// - Parameter model: Data source for the multiline component.
    init(model: FWTextModel) {
        self.model = model
        self.validator = FWRegexValidator(regex: model.regex)
    }
    
    // MARK: API
    
    /// Title of the component.
    var title: String {
        return model.title
    }
    
    /// Description of the component.
    var description: String {
        return model.description
    }
    
    /// Required of the component.
    var required: Bool {
        return model.required
    }
    
    /// Placeholder of the component.
    var placeholder: String {
        return model.placeholder
    }
    
    /// Type of the component.
    var type: FWComponentModelWrapper.Types {
        return model.type
    }
    
    /// Rule for the validator of this component.
    var validatorRuleMessage: String {
        return self.validator.validationRuleDescription
    }
    
    /// Boolean value indicating if the current input is valid.
    var isValid: Bool = false {
        didSet {
            delegate?.update()
        }
    }
    
    /// Content of the component inputted by the user.
    var content: String = "" {
        didSet {
            if required {
                isValid = validator.validate(content)
            } else if content.isEmpty {
                isValid = true
            } else {
                isValid = validator.validate(content)
            }
        }
    }
    
    /// Returns a snapshot of the component containing all the information currently stored in them.
    /// - Returns: `FWComponentSnapshot` containing the information of the component.
    func takeSnapshot() -> FWComponentSnapshot {
        return FWTextComponentSnapshot(id: model.id,
                                       title: model.title,
                                       description: model.description,
                                       required: model.required,
                                       regex: model.regex,
                                       placeholder: model.placeholder,
                                       content: content)
    }
    
}
