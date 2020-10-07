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
    case email = "email"
    /// Text Field for numerical input
    case numerical = "numerical"
    /// Text Field with hidden characters
    case password = "password"
    /// Selection field that allows only one option selected
    case singleSelect = "single_select"
    /// Selection field that allows multiple options selected
    case multipleSelect = "multiple_select"
    /// Date picker field
    case datePicker = "date_picker"

    /// Function of the FieldDecoder protocol that decodes the JSON
    /// following the coding keys that specify the data of the JSON.
    /// When sucessful it will return a FWField Structure of the case
    /// specified on the key type.
    /// - Parameter container: It is the container that will follow the ComponentCodingkeys.
    static func specs(from container: KeyedDecodingContainer<FWComponentKeys>) throws -> FWSpecs? {
        if let type = try container.decodeIfPresent(FWComponentTypes.self, forKey: .componentType) {
            switch type {
            case .plainText:
                return try container.decode(FWOneLineSpecs.self, forKey: .specs)
            case .textBox:
                return try container.decode(FWMultiLineSpecs.self, forKey: .specs)
            case .password:
                return try container.decode(FWSecureOneLineSpecs.self, forKey: .specs)
            case .email:
                return try container.decode(FWEmailSpecs.self, forKey: .specs)
            case .numerical:
                return try container.decode(FWDigitsSpecs.self, forKey: .specs)
            case .singleSelect:
                return try container.decode(FWSingleSelectSpecs.self, forKey: .specs)
            case .multipleSelect:
                return try container.decode(FWMultiSelectSpecs.self, forKey: .specs)
            case .datePicker:
                return try container.decode(FWDatePickerSpecs.self, forKey: .specs)
            @unknown default:
                fatalError("Inavalid/unknow fild type \(type)")
            }
        }
        return nil
    }
}
