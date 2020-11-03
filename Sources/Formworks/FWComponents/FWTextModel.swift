//
//  FWSingleLineModel.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 03/11/20.
//

import Foundation

/// A text component data struct. Title is the only required value for initialising.
struct FWTextModel: FWBaseComponentModel {
    var id: String = UUID().uuidString
    var title: String
    var description: String = ""
    var required: Bool = false
    var validator: String
    /// A custom regular expression for the component's text field validation. Only valid if validator attribute is set to "custom".
    var regex: String = ""
    /// Component's text field placeholder string.
    var placeholder: String = ""
    /// A Boolean value that determines if the component's text field will be a single line or multiple lines.
    var isMultiline: Bool = false
}
