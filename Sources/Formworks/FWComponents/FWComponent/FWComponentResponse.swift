//
//  File.swift
//  
//
//  Created by Rafael Galdino on 13/11/20.
//

import Foundation

protocol FWComponentResponse: Codable {
    static var type: FWResponseType { get }
}

enum FWResponseType: String, Codable {
    case text
    var metatype: FWComponentResponse.Type {
        switch self {
        case .text:
            return FWTextResponse.self
        default:
            return FWTextResponse.self
        }
    }
}
