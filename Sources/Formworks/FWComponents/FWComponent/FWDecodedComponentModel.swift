//
//  FWDecodedComponentModel.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 03/11/20.
//

import Foundation

/// Data structure for components being decoded.
struct FWDecodedComponentModel: Codable {
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
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Types.self)
        var decodedComponent: FWComponentModel?

        decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .text)

        if let component = decodedComponent {
            self.base = component
        } else {
            throw Errors.invalidComponent
        }
    }

    func encode(to encoder: Encoder) throws {
        try base.encode(to: encoder)
    }
}
