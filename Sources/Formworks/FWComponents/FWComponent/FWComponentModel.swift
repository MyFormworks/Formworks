//
//  FWComponentData.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation

///This protocol represents a basic component's data structure.
protocol FWComponentModel: Decodable {
    ///The UUID of the component.
    var id: String { get }
    ///The title of the component.
    var title: String { get }
    ///A description or subtitle for the component
    var description: String { get }
    ///A Boolean value that determines if the component is required to be filled or not.
    var required: Bool { get }
    ///A string specifying what kind of validation will be performed on the component's text field.
    var validator: String { get }
}

