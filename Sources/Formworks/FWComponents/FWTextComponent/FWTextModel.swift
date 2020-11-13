//
//  FWSingleLineModel.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 03/11/20.
//

import Foundation

/// A text component data struct. Title is the only required value for initialising.
struct FWTextModel: FWComponentModel {
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

/// Data Transfer Object for the Text component model.
///
/// Used for making the decoding inputs optional on entry.
fileprivate struct FWTextModelDTO: Codable {
    var id: String?
    var title: String?
    var description: String?
    var required: Bool?
    var validator: String?
    var regex: String?
    var placeholder: String?
    var isMultiline: Bool?
}

extension FWTextModel {
    init(from decoder: Decoder) throws {
        let dto = try FWTextModelDTO.init(from: decoder)
        self.id = dto.id ?? UUID().uuidString
        self.title = dto.title ?? ""
        self.description = dto.description ?? ""
        self.required = dto.required ?? false
        self.validator = dto.validator ?? ""
        self.regex = dto.regex ?? ""
        self.placeholder = dto.placeholder ?? ""
        self.isMultiline = dto.isMultiline ?? false
    }

    func encode(to encoder: Encoder) throws {
        let dto = FWTextModelDTO(id: self.id,
                                 title: self.title,
                                 description: self.description,
                                 required: self.required,
                                 validator: self.validator,
                                 regex: self.regex,
                                 placeholder: self.placeholder,
                                 isMultiline: self.isMultiline)
        try dto.encode(to: encoder)
    }
}

struct FWTextResponse: FWComponentResponse {
    static var type: FWResponseType = .text
    var content: String
}
