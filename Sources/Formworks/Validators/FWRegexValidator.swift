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
    using regexes '\(?\b([0-9]{2,3}|0((x|[0-9]){2,3}[0-9]{2}))\)?\s*[0-9]{4,5}[- ]*[0-9]{4}\b'.
     
    ## Phone Formats ##
        - 00 1234 1234
        - 00 12345 1234
        - (00)1234-1234
        - (00)12345-1234
        - (00)12345678
        - (00)123456789
        - (00) 1234 1234
        - (00) 12345 1234
        - (00) 12345678
        - (00) 123456789
        - (000)1234 1234
        - (000)12345 1234
     */
    case phonenumber
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
            return [#"\(?\b([0-9]{2,3}|0((x|[0-9]){2,3}[0-9]{2}))\)?\s*[0-9]{4,5}[- ]*[0-9]{4}\b"#]
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
