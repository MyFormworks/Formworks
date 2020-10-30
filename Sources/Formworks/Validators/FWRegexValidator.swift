//
//  FWRegexValidator.swift
//  Formworks
//
//  Created by Edgar Sgroi on 29/10/20.
//

import Foundation

/// Presetted regexes used in validation in the following cases:
enum FWRegex {
    /// Used to validate email  with the regex '[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}'.
    case email
    /**
    Used to validate Brazilian lendline phone numbers with DDD
    using regexes '[0-9]{2} [0-9]{8} and [0-9]{2} [0-9]{4}-[0-9]{4}'.
    The number format should be like:  00 12345678 or 00 1234-5678.
     */
    case phonenumber
    /**
     Used to validate Brazilian cellphone numbers  with the regex '[0-9]{2} [0-9]{9} and [0-9]{2} [0-9]{5}-[0-9]{4}'.
     The number format should be like:  00 123456789 or 00 1234-56789.
     */
    case cellphone
    /// Used to validation with maximum 32 characters with the regex '[0-9]{2} [0-9]{9} and [0-9]{2} [0-9]{5}-[0-9]{4}'.
    case max32
    /// Used to validate custom regexes
    case custom(regex: [String])
}

extension FWRegex {
    func getRegex() -> [String] {
        switch self {
        case .email:
            return ["[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}"]
        case .phonenumber:
            return ["[0-9]{2} [0-9]{8}", "[0-9]{2} [0-9]{4}-[0-9]{4}"]
        case .cellphone:
            return ["[0-9]{2} [0-9]{9}", "[0-9]{2} [0-9]{5}-[0-9]{4}"]
        case .max32:
            return ["[A-Za-z0-9 !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]{0,32}"]
        case .custom(let string):
            return string
        }
    }
}

/// A validator that uses regexes to validation.
struct FWRegexValidator: FWValidator {
    let regexs: [String]
    
    init(regex: FWRegex) {
        self.regexs = regex.getRegex()
    }
    
    func validate(_ content: String) -> Bool {
        for regex in regexs {
            let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
            if predicate.evaluate(with: content) {
                return true
            }
        }
        return false
    }
}
