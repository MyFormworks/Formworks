//
//  File.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation
protocol FieldDecoder {
	
}

extension FieldDecoder {
	func decodeField(from container: KeyedDecodingContainer<ComponentCodingkeys>) throws -> Field? {
		if let type = try container.decode(String?.self, forKey: .type) {
			
		}
		return nil
	}
}
