//
//  FWForm.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation

///This struct represents the form itself.
struct FWFormModel  {
    let id: String
    let responseType: String
	let title: String
	let components: [FWBaseComponentModel]

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
    
    enum Responses: String {
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
        self.responseType = try container.decode(String.self, forKey: .responseType)
        self.title = try container.decode(String.self, forKey: .title)
        self.components = try container.decode([FWDecodedComponentModel].self, forKey: .components).map { $0.base }
    }

}
