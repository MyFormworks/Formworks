//
//  FWDecodedComponentModel.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 03/11/20.
//

import Foundation

struct FWDecodedComponentModel: Decodable {
    var base: FWBaseComponentModel
    /**
     Components Coding Keys.

     This enum holds all the attributes of a component.
     Used in decoding the object.
     */
    private enum Errors: Error {
        case invalidComponent
    }
    
    private enum Types: String, CodingKey {
        case text
    }

    init(_ base: FWBaseComponentModel) {
        self.base = base
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
