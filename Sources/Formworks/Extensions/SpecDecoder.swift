//
//  SpecDecoder.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation
/// Protocol that will be in charge of decoding our JSON as we specify
protocol SpecDecoder {
	
}

extension SpecDecoder {
    /// Function of the FieldDecoder protocol that decodes the JSON
    /// following the coding keys that specify the data of the JSON.
    /// When sucessful it will return a FWField Structure of the case
    /// specified on the key type.
    /// - Parameter container: It is the container that will follow the ComponentCodingkeys.
    func decodeField(from container: KeyedDecodingContainer<FWComponentKeys>) throws -> FWSpecs? {
        if let type = try container.decode(String?.self, forKey: .componentType) {
			switch type {
				case "on-line":
					return try container.decode(FWOneLine.self, forKey: .specs)
				case "multi-line":
					return try container.decode(FWMultiLine.self, forKey: .specs)
				case "secure-on-line":
					return try container.decode(FWSecureOneLine.self, forKey: .specs)
				case "email":
					return try container.decode(FWEmail.self, forKey: .specs)
				case "digits":
					return try container.decode(FWDigits.self, forKey: .specs)
				case "single-select":
					return try container.decode(FWSingleSelect.self, forKey: .specs)
				case "multi-select":
					return try container.decode(FWMultiSelect.self, forKey: .specs)
				case "date-Picker":
					return try container.decode(FWDatePicker.self, forKey: .specs)
				default:
					fatalError("Inavalid/unknow fild type \(type)")
			}
		}
		return nil
	}
}
