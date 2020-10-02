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
    case componentType
    case title
    case subtitle
    case isObrigatory
    case fields
}
