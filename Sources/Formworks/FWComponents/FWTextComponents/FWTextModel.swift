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
    /// A custom regular expression for the component's text field validation. Only valid if validator attribute is set to "custom".
    var regex: String = ""
    /// Component's text field placeholder string.
    var placeholder: String = ""
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
    var isMultiline: Bool?
}

extension FWTextModel {
    init(from decoder: Decoder) throws {
        let dto = try FWTextModelDTO.init(from: decoder)
        self.id = dto.id ?? UUID().uuidString
        self.title = dto.title ?? ""
        self.description = dto.description ?? ""
        self.required = dto.required ?? false
        self.regex = dto.regex ?? ""
        self.placeholder = dto.placeholder ?? ""
    }

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

struct FWTextResponse: FWComponentResponse {
    static var type: FWResponseType = .text
    var content: String
}
