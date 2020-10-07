//
//  FWComponentKeys.swift
//  
//
//  Created by Rafael Galdino on 02/10/20.
//
/**
 Components Coding Keys

 This enum holds all the attributes of a component. Used in decoding the object.
 */
enum FWComponentKeys: String, CodingKey{
    case title
    case subtitle
    case errorMessage
    case componentType
    case required
    case specs

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
