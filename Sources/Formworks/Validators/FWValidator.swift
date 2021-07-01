import Foundation

/// A protocol that every validator class need to conform to validate components.
public protocol FWValidator {
    /// Verifies if a given content is valid according to this validators rules.
    /// - Parameter content: The content that will be validated.
    /// - Returns: Boolean value indicating if the content was accepted by the rule.
    func validate(_ content: String) -> Bool
    /// Description of the validator's rule and how it behaves.
    var validationRuleDescription: String { get }
}
