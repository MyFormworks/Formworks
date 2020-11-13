//
//  FWComponentResponseWrapper.swift
//  
//
//  Created by Rafael Galdino on 13/11/20.
//

import Foundation

struct FWComponentResponseWrapper: Codable {
    var response: FWComponentResponse?

    init(_ response: FWComponentResponse) {
        self.response = response
    }
    private enum CodingKeys: String, CodingKey{
        case response, type
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let type = try container.decodeIfPresent(FWResponseType.self, forKey: .type){
            self.response = try type.metatype.init(from: container.superDecoder(forKey: .response))
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let response = response {
            try container.encode(type(of: response).type, forKey: .type)
            try response.encode(to: container.superEncoder(forKey: .response))
        }
    }
}
