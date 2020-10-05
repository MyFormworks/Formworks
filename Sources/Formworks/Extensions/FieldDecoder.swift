//
//  File.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation
/// Protocol that will be in charge of decoding our JSON as we specify
protocol FieldDecoder {
	
}

extension FieldDecoder {
    /// Function of the FieldDecoder protocol that decodes the JSON
    /// following the coding keys that specify the data of the JSON.
    /// When sucessful it will return a FWField Structure of the case
    /// specified on the key type.
    /// - Parameter container: It is the container that will follow the ComponentCodingkeys.
	func decodeField(from container: KeyedDecodingContainer<ComponentCodingkeys>) throws -> FWField? {
		if let type = try container.decode(String?.self, forKey: .type) {
			switch type {
				case "on-line":
					return try container.decode(FWOneLine.self, forKey: .field)
				case "multi-line":
					return try container.decode(FWMultiLine.self, forKey: .field)
				case "secure-on-line":
					return try container.decode(FWSecureOneLine.self, forKey: .field)
				case "email":
					return try container.decode(FWEmail.self, forKey: .field)
				case "digits":
					return try container.decode(FWDigits.self, forKey: .field)
				case "single-select":
					return try container.decode(FWSingleSelect.self, forKey: .field)
				case "multi-select":
					return try container.decode(FWMultiSelect.self, forKey: .field)
				case "date-Picker":
					return try container.decode(FWDatePicker.self, forKey: .field)
				default:
					fatalError("Inavalid/unknow fild type \(type)")
			}
		}
		return nil
	}
}
