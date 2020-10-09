//
//  FWSingleLineViewModel.swift
//  
//
//  Created by Edgar Sgroi on 05/10/20.
//

import Foundation

/// Delegate responsible to binding the `FWSingleLineViewModel`
/// with a `View`.
protocol FWSingleLineViewModelDelegate: AnyObject {
    func updateInterface()
}

/// The `FWSingleLine`'s  `ViewModel`.
final class FWSingleLineViewModel {
    
    weak var delegate: FWSingleLineViewModelDelegate?

    private let validator: FWValidator
    
    init(_ validator: FWValidator) {
        self.validator = validator
    }
    
    var content: String = "" {
        didSet {
            isValid = validate(content)
        }
    }
    
    var isValid: Bool = false {
        didSet {
            delegate?.updateInterface()
        }
    }

    private func validate(_ content: String) -> Bool {
        var valid = false
        let regexs = validator.regex()

        for regex in regexs {
            let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
            if predicate.evaluate(with: content) {
                valid = true
            }
        }
        
        return valid
    }
}
