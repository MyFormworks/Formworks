//
//  File.swift
//  
//
//  Created by Rafael Galdino on 01/10/20.
//
/**
 Components Helper.

 Holds constant components type strings and errors.
 */
enum Helper {
    /**
     Contains all the possible components types.
     */
    enum FWComponentTypes {
        static let plainText: String = "plain_text"
        static let email: String = "email"
        static let password: String = "password"
        static let singleSelect: String = "single_select"
        static let multipleSelect: String = "multiple_select"
        static let datePicker: String = "date_picker"
    }
    /**
     Possible component error values.
     */
    enum ComponentErrors: Error {
        case couldNotDecodeType
        case componentTypeUnavaiable
    }
}
