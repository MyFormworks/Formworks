//
//  FWComponentKey.swift
//  
//
//  Created by Rafael Galdino on 02/10/20.
//
/**
 Components Coding Keys.

 This enum holds all the attributes of a component.
 Used in decoding the object.
 */
enum FWComponentKey: String, CodingKey {
    case id
    case title
    case description
    case type
    case required
    case validator

    /// Component Decodification  Errors
    enum Errors: Error, CustomStringConvertible {
        case couldNotDecode

        var description: String {
            switch self {
            case .couldNotDecode:
                return "Component Type could not be decoded into any type of component"
            }
        }
    }
}
