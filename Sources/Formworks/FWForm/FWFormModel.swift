//
//  FWForm.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation

/// Data structure for the form.
struct FWFormModel  {
    /// The UUID of the component.
    let id: String
    /// The title of the form.
    let title: String
    /// The format that the form response will have.
    let responseFormat: ResponseFormats
    /// A collection of component's data structure contained in this form.
	let components: [FWBaseComponentModel]

    /// Form Decodification  Errors
    private enum Errors: Error, CustomStringConvertible {
        case couldNotDecode

        var description: String {
            switch self {
            case .couldNotDecode:
                return "Form decoding failure"
            }
        }
    }

    /// Form response formats
    private enum ResponseFormats: String, Decodable {
        case short
        case long
    }
}

extension FWFormModel: Decodable {
    /**
     Form Coding Keys.

     This enum holds all the attributes of a form.
     Used in decoding the JSON.
     */
    enum CodingKeys: String, CodingKey {
        case id,responseType,title, components
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FWFormModel.CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.responseFormat = try container.decode(ResponseFormats.self, forKey: .responseType)
        self.title = try container.decode(String.self, forKey: .title)
        self.components = try container.decode([FWDecodedComponentModel].self, forKey: .components).map { $0.base }
    }

}
