//
//  FWComponentTypes.swift
//  
//
//  Created by Rafael Galdino on 01/10/20.
//
/**
 Contains all the possible components types.
 */
enum FWComponentTypes: String, Decodable {
    /// Text Field for general type of text
    case plainText = "plain_text"
    /// Text Field variation for multiple lines
    case textBox = "text_box"
    /// Text Field with email format validation
    case email
    /// Text Field for numerical input
    case numerical
    /// Text Field with hidden characters
    case password
    /// Selection field that allows only one option selected
    case singleSelect = "single_select"
    /// Selection field that allows multiple options selected
    case multipleSelect = "multiple_select"
    /// Date picker field
    case datePicker = "date_picker"

    /**
     Function of the FieldDecoder protocol that decodes the JSON following the coding keys that specify the data of the JSON.
     When sucessful it will return a FWField Structure of the case
     - Parameter container: It is the container that will follow the ComponentCodingkeys.
     */
    /// specified on the key type.
    static func specs(from container: KeyedDecodingContainer<FWComponentKeys>) throws -> FWSpecs? {
        guard let type = try container.decodeIfPresent(FWComponentTypes.self, forKey: .componentType) else {
            return nil
        }
            switch type {
            case .plainText:
                return try container.decodeIfPresent(FWPlainTextSpecs.self, forKey: .specs)
            case .textBox:
                return try container.decodeIfPresent(FWMultiLineSpecs.self, forKey: .specs)
            case .password:
                return try container.decodeIfPresent(FWSecureOneLineSpecs.self, forKey: .specs)
            case .email:
                return try container.decodeIfPresent(FWEmailSpecs.self, forKey: .specs)
            case .numerical:
                return try container.decodeIfPresent(FWDigitsSpecs.self, forKey: .specs)
            case .singleSelect:
                return try container.decodeIfPresent(FWSingleSelectSpecs.self, forKey: .specs)
            case .multipleSelect:
                return try container.decodeIfPresent(FWMultiSelectSpecs.self, forKey: .specs)
            case .datePicker:
                return try container.decodeIfPresent(FWDatePickerSpecs.self, forKey: .specs)
//          Ignore the "will never execute" warning.
//          @unknown default will throw a warning if a type
//          is not covered by the switch statement.
            @unknown default:
                fatalError("Inavalid/unknow fild type \(type)")
            }
    }
}
