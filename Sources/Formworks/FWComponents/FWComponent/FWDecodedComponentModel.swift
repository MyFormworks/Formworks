//
//  FWDecodedComponentModel.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 03/11/20.
//

import Foundation

/// Data structure for components being decoded.
struct FWDecodedComponentModel: Decodable {
    /// Component data decoded in their respective format
    var base: FWComponentModel

    /// Component decoding errors
    private enum Errors: Error {
        case invalidComponent
    }

    /// Component possible types in the JSON.
    private enum Types: String, CodingKey {
        case text
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Types.self)
        if let component = try container.decodeIfPresent(FWTextModel.self, forKey: .text) {
            self.base = component
            return
        }
        throw Errors.invalidComponent
    }
}
