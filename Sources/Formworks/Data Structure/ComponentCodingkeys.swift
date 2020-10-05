//
//  ComponentCodingkeys.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation

///This enum is used to decode of given JSON to the form's variables.
enum ComponentCodingkeys: String, CodingKey {
	case title
	case subtitle
	case type
	case errorText
	case isObligatory
	case field
}
