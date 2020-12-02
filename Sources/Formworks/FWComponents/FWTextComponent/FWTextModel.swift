//
//  FWSingleLineModel.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 03/11/20.
//

import Foundation

/// A text component data struct. Title is the only required value for initialising.
struct FWTextModel: FWComponentModel {
    /// The UUID of the component.
    var id: String = UUID().uuidString
    /// The title of the component.
    var title: String
    /// A description or subtitle for the component
    var description: String = ""
    /// A Boolean value that determines if the component is required to be filled or not.
    var required: Bool = false
    /// A custom regular expression for the component's text field validation. Only valid if validator attribute is set to "custom".
    var regex: String = ""
    /// Component's text field placeholder string.
    var placeholder: String = ""
    /// Component Specific Type
    var type: FWComponentModelWrapper.Types = .text
}

/// Data Transfer Object for the Text component model.
///
/// Used for making the decoding inputs optional on entry.
fileprivate struct FWTextModelDTO: FWComponentModelDTO {
    var id: String?
    var title: String?
    var description: String?
    var required: Bool?
    /// A custom regular expression for the component's text field validation. Only valid if validator attribute is set to "custom".
    var regex: String?
    var placeholder: String?
}

extension FWTextModel {
    /**
     Creates a new instance by decoding from the given decoder.

     This initializer throws an error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
     - Parameter decoder: The decoder to read data from.
     - Throws: Error decoding the data transfer object.
     */
    init(from decoder: Decoder) throws {
        let dto = try FWTextModelDTO.init(from: decoder)
        self.id = dto.id ?? UUID().uuidString
        self.title = dto.title ?? ""
        self.description = dto.description ?? ""
        self.required = dto.required ?? false
        self.regex = dto.regex ?? ""
        self.placeholder = dto.placeholder ?? ""
    }

    /**
     Encodes this value into the given encoder.

     If the value fails to encode anything, encoder will encode an empty keyed container in its place.
     This function throws an error if any values are invalid for the given encoder’s format.
     - Parameter encoder: The encoder to write data to.
     - Throws: Error encoding the data transfer object.
     */
    func encode(to encoder: Encoder) throws {
        let dto = FWTextModelDTO(id: self.id,
                                 title: self.title,
                                 description: self.description,
                                 required: self.required,
                                 regex: self.regex,
                                 placeholder: self.placeholder)
        try dto.encode(to: encoder)
    }
}

extension FWTextModel: Equatable {}
