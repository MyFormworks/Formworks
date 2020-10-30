//
//  FWForm.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation

///This struct represents the form itself.
struct FWFormData  {
	let title: String
	let components: [FWComponentModel]

    /// Form Decodification  Errors
    enum Errors: Error, CustomStringConvertible {
        case couldNotDecode

        var description: String {
            switch self {
            case .couldNotDecode:
                return "Form decoding failure"
            }
        }
    }
}

extension FWFormData: Codable {
    /**
     Form Coding Keys.

     This enum holds all the attributes of a form.
     Used in decoding the JSON.
     */
    enum CodingKeys: String, CodingKey {
        case title, components
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FWFormData.CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.components = try container.decode([FWAnyComponent].self, forKey: .components).map { $0.base }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: FWFormData.CodingKeys.self)
        try container.encode(components.map(FWAnyComponent.init), forKey: .components)
        try container.encode(title, forKey: .title)
    }
}
