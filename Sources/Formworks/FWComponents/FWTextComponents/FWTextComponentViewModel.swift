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

class FWTextComponentViewModel: FWComponentViewModel {
    // MARK: Properties
    weak var delegate: FWTextComponentViewModelDelegate?
    
    private let validator: FWRegexValidator
    private let model: FWTextModel

    // MARK: Init
    init(model: FWTextModel) {
        self.model = model
        self.validator = FWRegexValidator(regex: model.regex)
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
    var type: FWComponentModelWrapper.Types {
        return model.type
    }
    
    var isValid: Bool = false {
        didSet {
            if oldValue != isValid {
                delegate?.update()
            } else if !required {
                delegate?.update()
            }
        }
    }
    
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
    
    func takeSnapshot() -> FWTextComponentSnapshot {
        return FWTextComponentSnapshot(id: model.id,
                                       title: model.title,
                                       description: model.description,
                                       required: model.required,
                                       regex: model.regex,
                                       placeholder: model.placeholder,
                                       content: content)
    }
    
}
