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
    // MARK: Properties
    weak var delegate: FWSingleLineViewModelDelegate?

    private let validator: FWValidator

    // MARK: Init
    init(_ data: FWComponentData, with validator: FWValidator) {
        self.validator = validator
        self.title = data.title
        self.subtitle = data.subtitle ?? ""
        self.errorMessage = data.errorMessage ?? ""
        self.required = data.required
    }

    // MARK: API
    let title: String

    let subtitle: String

    let errorMessage: String

    let required: Bool

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

    // MARK: Private
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
