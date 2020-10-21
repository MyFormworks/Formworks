//
//  FWComponentType.swift
//  
//
//  Created by Rafael Galdino on 01/10/20.
//

/// Contains all the possible components types.
enum FWComponentType: String, Decodable {
    /// Text Component for general type of text
    case singleLine = "plain_text"
    /// Text Component variation for multiple lines
    case multiLine = "text_box"
    /// Text Component with email format validation
    case email
    /// Text Component for numerical input
    case numerical
    /// Text Component with hidden characters
    case password
    /// Selection Component that allows only one option selected
    case singleSelect = "single_select"
    /// Selection Component that allows multiple options selected
    case multipleSelect = "multiple_select"
    /// Date picker Component
    case datePicker = "date_picker"

    /**
     Decodes the JSON following the coding keys that specify the data of the JSON.
     
     When sucessful it will return a `FWSpecification` Structure of the case specified on the key type.
     - Parameter container: It is the container that will follow the ComponentCodingkeys.
     */
    static func specification(for container: KeyedDecodingContainer<FWComponentKey>) throws -> FWSpecification? {
        guard let type = try container.decodeIfPresent(FWComponentType.self, forKey: .componentType) else {
            return nil
        }
            switch type {
            case .singleLine:
                return try container.decodeIfPresent(FWSingleLineSpecification.self, forKey: .specs)
            case .multiLine:
                return try container.decodeIfPresent(FWMultiLineSpecification.self, forKey: .specs)
            case .password:
                return try container.decodeIfPresent(FWSecureOneLineSpecification.self, forKey: .specs)
            case .email:
                return try container.decodeIfPresent(FWEmailSpecification.self, forKey: .specs)
            case .numerical:
                return try container.decodeIfPresent(FWDigitsSpecification.self, forKey: .specs)
            case .singleSelect:
                return try container.decodeIfPresent(FWSingleSelectSpecification.self, forKey: .specs)
            case .multipleSelect:
                return try container.decodeIfPresent(FWMultiSelectSpecification.self, forKey: .specs)
            case .datePicker:
                return try container.decodeIfPresent(FWDatePickerSpecification.self, forKey: .specs)
//          Ignore the "will never execute" warning.
//          @unknown default will throw a warning if a type
//          is not covered by the switch statement.
            @unknown default:
                fatalError("Inavalid/unknow fild type \(type)")
            }
    }
}
