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

fileprivate struct FWFormModelDTO: Decodable {
    /// The UUID of the component.
    let id: String?
    /// The title of the form.
    let title: String?
    /// The format that the form response will have.
    let responseFormat: FWFormModel.ResponseFormats?
    /// A collection of component's data structure contained in this form.
    let components: [FWComponentModelWrapper]
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
        let dto = try FWFormModelDTO.init(from: decoder)
        self.id = dto.id ?? UUID().uuidString
        self.title = dto.title ?? ""
        self.responseFormat = dto.responseFormat ?? ResponseFormats.long
        self.components = dto.components.compactMap({
            $0.base
        })
        self.style = dto.style ?? FWStyleSpecification()
    }
<<<<<<< HEAD
=======

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: FWFormModel.CodingKeys.self)
        try container.encode(components.map(FWComponentModelWrapper.init), forKey: .components)
        try id.encode(to: encoder)
        try title.encode(to: encoder)
        try responseFormat.encode(to: encoder)
        try style.encode(to: encoder)
    }
>>>>>>> 8ec879dc0c4c5b2be223e5b30597600cc994bb0f
}
