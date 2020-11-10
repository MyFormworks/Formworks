//
//  FWTextComponentViewModel.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 09/11/20.
//

import Foundation

// MARK: Protocol-Delegate
protocol FWTextComponentViewModelDelegate: AnyObject {
    func update()
    
}

final class FWTextComponentViewModel: FWComponentViewModel {
    // MARK: Properties
    weak var delegate: FWTextComponentViewModelDelegate?
    
    private let validator: FWRegexValidator
    private let model: FWTextModel

    // MARK: Init
    init(model: FWTextModel) {
        self.model = model
        switch model.validator {
        case "email":
            self.validator = FWRegexValidator(regex: .email)
        case "phonenumber":
            self.validator = FWRegexValidator(regex: .phonenumber)
        case "max32":
            self.validator = FWRegexValidator(regex: .max32)
        case "custom":
            self.validator = FWRegexValidator(regex: .custom(regex: [model.regex]))
        default:
            self.validator = FWRegexValidator(regex: .max32)
        }
    }

    // MARK: API
    var title: String {
        return model.title
    }
    var description: String {
        return model.title
    }
    var required: Bool {
        return model.required
    }
    var placeholder: String {
        return model.placeholder
    }
    
    var isValid: Bool = false {
        didSet {
            if oldValue != isValid {
                delegate?.update()
            }
        }
    }
    
    var content: String = "" {
        didSet {
            isValid = validator.validate(content)
        }
    }
    
    func takeSnapshot() -> FWComponentSnapshot {
        return FWTextComponentSnapshot(id: model.id,
                                       title: model.title,
                                       description: model.description,
                                       required: model.required,
                                       validator: model.validator,
                                       regex: model.regex,
                                       placeholder: model.placeholder,
                                       isMultiline: model.isMultiline,
                                       content: content)
    }
    
}
