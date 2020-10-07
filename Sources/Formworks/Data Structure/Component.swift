//
//  File.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation

/// This struct represents cell's configuration. All variables declared here will be components presented in each cell of CollectionView.
struct Component: Decodable, FieldDecoder {
    
    ///This enum is used to decode of given JSON to the form's variables.
    enum CodingKeys: String, CodingKey {
        case title
        case subtitle
        case type
        case errorText
        case required
        case field
    }
	
	///This variable is the title of the form. It will appear at first on screen.
	let title: String
	///This variable is the subtitle of the form and represents a brief description about what is the form's porpose. It will appear at second on screen.
	let subtitle: String?
	///This variable is the error message which will appear if user write something incompatible to field type.
	let errorText: String
	///This variable will appear if the field must be filled.
	var required: String
	///This variable is the type of content that users can add in the fiel.
	var field: FWSpec? = nil

	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.title = try container.decode(String.self, forKey: .title)
		self.subtitle = try container.decode(String.self, forKey: .subtitle)
		self.errorText = try container.decode(String.self, forKey: .errorText)
		self.required = try container.decode(String.self, forKey: .required)
		self.field = try decodeField(from: container)
	}
}


