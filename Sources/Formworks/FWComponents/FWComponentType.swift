//
//  FWComponentType.swift
//  
//
//  Created by Rafael Galdino on 01/10/20.
//

/// Contains all the possible components types.
enum FWComponentType: String, Codable {
    /// Text Component for general type of text
    case text

    var metatype: FWComponentModel.Type {
        switch self {
        case .text:
            return FWTextDataModel.self
        }
    }
}
