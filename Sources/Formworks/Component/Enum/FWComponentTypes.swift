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
    /// Text Field with email format validation
    case email = "email"
    /// Text Field with hidden characters
    case password = "password"
    /// Selection field that allows only one option selected
    case singleSelect = "single_select"
    /// Selection field that allows multiple options selected
    case multipleSelect = "multiple_select"
    /// Date picker field
    case datePicker = "date_picker"

    /**
     Returns the specification structure for this  component type/
     - Parameters:
     - dict: parameters for the specifications
     */
    func specsFor(_ dict: [String: Any]) -> FWSpecs {
        switch self {
        case .plainText:
            break
        case .email:
            break
        case .password:
            break
        case .singleSelect:
            break
        case .multipleSelect:
            break
        case .datePicker:
            break
        }
        #warning("TODO: Component specifications need to be implemented")
        fatalError("Components specifications not implemented")
    }
}
