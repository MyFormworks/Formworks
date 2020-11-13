//
//  FWFormResponse.swift
//  
//
//  Created by Rafael Galdino on 13/11/20.
//

import Foundation

struct FWFormResponse {
    var components: [FWComponentResponse]

    private enum CodingKeys: String, CodingKey {
        case components
    }
}

extension FWFormResponse: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.components = try container.decode([FWComponentResponseWrapper].self, forKey: .components).compactMap { $0.response }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(components.map(FWComponentResponseWrapper.init), forKey: .components)
    }
}
