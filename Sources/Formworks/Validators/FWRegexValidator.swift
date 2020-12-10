//
//  FWRegexValidator.swift
// 
//
//  Created by Edgar Sgroi on 29/10/20.
//

import Foundation

// MARK: FWRegex
/// Collection of default Regular Expressions strings.
enum FWRegex: String {
    /// Matches E-mail strings i.e. example@example.org.
    ///
    /// Regex rule: '[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}'
    case email = "[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}"
    /**
    Matches Brazilian phone numbers with DDD (landline and mobile) strings

    Regex rule: '\(?\b([0-9]{2,3}|0((x|[0-9]){2,3}[0-9]{2}))\)?\s*[0-9]{4,5}[- ]*[0-9]{4}\b'.
     
    ## Phone Formats ##
        - 0012345678
        - 00123456789
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
        - 0000123456789
     */
    case phonenumber = #"\(?\b([0-9]{2,3}|0((x|[0-9]){2,3}[0-9]{2}))\)?\s*[0-9]{4,5}[- ]*[0-9]{4}\b"#
    /// Matches strings with a maximum of 32 characters.
    ///
    /// Regex rule: '[A-Za-z0-9 !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]{0,32}'
    case max32 = "[A-Za-z0-9 !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]{0,32}"
    /// Matches strigns with numerical characters only format.
    ///
    /// Regex rule: '[0-9]*'
    case numerical = "[0-9]+"

    /// Localized string describing the rule for matching this regular expression.
    var localizedDescription: String {
        switch self {
        case .email:
            return "Please provide a valid e-mail address."
        case .max32:
            return "Maximum limit of 32 characters."
        case .phonenumber:
            return "Please type in a Brazillian phone number."
        case .numerical:
            return "Only numerical characters are accepted."
        @unknown default:
            return ""
        }
    }
}

// MARK: FWRegexValidator
/// A validator that uses regexes to validation.
struct FWRegexValidator: FWValidator {
    /// Description of the validator's rule and how it behaves.
    var validationRuleDescription: String

    /// Regular expression used to validate entries.
    let regexRule: String

    /// Initializes a text based validator.
    /// - Parameter regex: The regular expression used as a validation rule.
    init(regex: String) {
        self.regexRule = regex
        self.validationRuleDescription = FWRegex(rawValue: regex)?.localizedDescription ?? ""
    }

    /// Verifies if a given text is valid according to this validators rules.
    ///
    /// If there are no rules, it automatically accepts the text.
    /// - Parameter content: The text that will be validated.
    /// - Returns: Boolean value indicating if the text was accepted by the rule.
    func validate(_ content: String) -> Bool {
        if regexRule.isEmpty { return true }
        let predicate = NSPredicate(format: "SELF MATCHES %@", regexRule)
        if predicate.evaluate(with: content) {
            return true
        }
        return false
    }
}
