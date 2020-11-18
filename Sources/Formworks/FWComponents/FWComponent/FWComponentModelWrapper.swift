//
//  FWDecodedComponentModel.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 03/11/20.
//

import Foundation

/// Data structure for components being decoded.
struct FWComponentModelWrapper: Codable {
    /// Component data decoded in their respective format
    var base: FWComponentModel

    init(_ base: FWComponentModel) {
        self.base = base
    }

    /// Component decoding errors
    private enum Errors: Error {
        /// Error thrown when the component is invalid or unknown
        case invalidComponent
    }

    /// Component possible types in the JSON.
    enum Types: String, CodingKey {
        case text
        case multiline
        case numerical
        case email
        case phonenumber
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Types.self)

        if let decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .text) {
            self.base = decodedComponent
            return
        } else if let decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .multiline) {
            var component = decodedComponent
            component.type = FWComponentModelWrapper.Types.multiline
            self.base = component
            return
        } else if let decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .numerical) {
            var component = decodedComponent
            component.type = FWComponentModelWrapper.Types.numerical
            self.base = component
            return
        } else if let decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .email) {
            var component = decodedComponent
            component.regex = FWRegex.email.rawValue
            component.type = .email
            self.base = component
            return
        } else if let decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .phonenumber) {
            var component = decodedComponent
            component.regex = FWRegex.phonenumber.rawValue
            component.type = .phonenumber
            self.base = component
            return
        }

        throw Errors.invalidComponent
    }

    func encode(to encoder: Encoder) throws {
        try base.encode(to: encoder)
    }
}
