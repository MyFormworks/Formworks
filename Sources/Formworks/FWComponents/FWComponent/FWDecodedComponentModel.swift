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
        case multiline
        case numerical
        case email
        case phonenumber
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Types.self)
        
        if let component = try container.decodeIfPresent(FWTextModel.self, forKey: .text) {
            self.base = component
            return
        }
        
        if let component = try container.decodeIfPresent(FWTextModel.self, forKey: .multiline) {
            self.base = component
            return
        }
        
        if let component = try container.decodeIfPresent(FWTextModel.self, forKey: .numerical) {
            self.base = component
            return
        }
        
        if let decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .email) {
            var component = decodedComponent
            component.regex = FWRegex.email.rawValue
            self.base = component
            return
        }
        
        if let decodedComponent = try container.decodeIfPresent(FWTextModel.self, forKey: .phonenumber) {
            var component = decodedComponent
            component.regex = FWRegex.phonenumber.rawValue
            self.base = component
            return
        }
        
        throw Errors.invalidComponent
    }
}
