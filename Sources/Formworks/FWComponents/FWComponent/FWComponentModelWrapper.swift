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
    var componentModel: FWComponentModel

    /// Instantiates a wrapper for FWComponentModel
    /// - Parameter base: the component model to be contained in this wrapper
    init(_ base: FWComponentModel) {
        self.componentModel = base
    }

    /// Component decoding errors
    private enum Errors: Error {
        /// Error thrown when the component is invalid or unknown
        case invalidComponent
    }

    /// Types of component supported by Formworks.
    ///
    /// For decoding techniques of each of these cases, please refer to
    /// the `init(from decoder: Decoder) throws` method
    /// from `FWComponentModelWrapper`.
    enum Types: String, CodingKey {
        case text
        case multiline
        case numerical
        case email
        case phonenumber
    }

    /// Creates a new instance by decoding from the given decoder.
    ///
    /// This initializer throws an error if reading from the decoder fails, or
    /// if the data read is corrupted or otherwise invalid.
    ///
    /// - Parameter decoder: The decoder to read data from.
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Types.self)

        if let decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .text) {
            self.componentModel = decodedComponent
            return
        } else if let decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .multiline) {
            var component = decodedComponent
            component.type = .multiline
            self.componentModel = component
            return
        } else if let decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .numerical) {
            var component = decodedComponent
            component.regex = FWRegex.numerical.rawValue
            component.type = .numerical
            self.componentModel = component
            return
        } else if let decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .email) {
            var component = decodedComponent
            component.regex = FWRegex.email.rawValue
            component.type = .email
            self.componentModel = component
            return
        } else if let decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .phonenumber) {
            var component = decodedComponent
            component.regex = FWRegex.phonenumber.rawValue
            component.type = .phonenumber
            self.componentModel = component
            return
        }

        throw Errors.invalidComponent
    }

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    func encode(to encoder: Encoder) throws {
        try componentModel.encode(to: encoder)
    }
}
