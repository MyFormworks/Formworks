//
//  File.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation

/// This struct represents cell's configuration. All variables declared here will be components presented in each cell of CollectionView.
struct Component: Decodable, FieldDecoder {
	
	///This variable is the title of the form. It will appear at first on screen.
	let title: String
	
	///This variable is the subtitle of the form and represents a brief description about what is the form's porpose. It will appear at second on screen.
	let subtitle: String?
	
	///This variable is the error message which will appear if user write something incompatible to field type.
	let errorText: String
	
	///This variable will appear if the field must be filled.
	var isObligatory: String
	
	
	///This variable is the type of content that users can add in the fiel.
	var field: FWField? = nil

	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: ComponentCodingkeys.self)
		self.title = try container.decode(String.self, forKey: .title)
		self.subtitle = try container.decode(String.self, forKey: .subtitle)
		self.errorText = try container.decode(String.self, forKey: .errorText)
		self.isObligatory = try container.decode(String.self, forKey: .isObligatory)
		self.field = try decodeField(from: container)
	}
}
