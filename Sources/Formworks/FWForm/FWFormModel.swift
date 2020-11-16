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
	let components: [FWComponentModel]
    let style: FWStyleSpecification

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
    enum ResponseFormats: String, Codable {
        /// Short response format
        ///
        /// Components information contain: ID, title and user inputed value.
        case short
        /// Long response format
        ///
        /// Will return all the information of the component along with the user inputted values.
        case long
    }
}

fileprivate struct FWFormModelDTO {
    /// The UUID of the component.
    let id: String?
    /// The title of the form.
    let title: String?
    /// The format that the form response will have.
    let responseFormat: FWFormModel.ResponseFormats?
    /// A collection of component's data structure contained in this form.
    let components: [FWComponentModel]
    let style: FWStyleSpecification?
}

extension FWFormModel: Codable {
    /**
     Form Coding Keys.

     This enum holds all the attributes of a form.
     Used in decoding the JSON.
     */
    private enum CodingKeys: String, CodingKey {
        case id,responseFormat,title, components, style, response
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FWFormModel.CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.responseFormat = try container.decode(ResponseFormats.self, forKey: .responseFormat)
        self.title = try container.decode(String.self, forKey: .title)
        self.components = try container.decode([FWDecodedComponentModel].self, forKey: .components).map { $0.base }
        self.style = try container.decode(FWStyleSpecification.self, forKey: .style)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: FWFormModel.CodingKeys.self)
        try container.encode(components.map(FWDecodedComponentModel.init), forKey: .components)
        try id.encode(to: encoder)
        try title.encode(to: encoder)
        try responseFormat.encode(to: encoder)
        try style.encode(to: encoder)
    }
}
