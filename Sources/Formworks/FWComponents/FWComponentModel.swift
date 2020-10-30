//
//  FWComponentData.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation

/**
 This struct represents the component's data structure.

 All variables declared here will be components presented in each cell of CollectionView.
 */
protocol FWComponentModel: Codable {
    ///This variable is the title of the form. It will appear at first on screen.
    static var type: FWComponentType { get }
    ///This variable is the title of the form. It will appear at first on screen.
    var id: String { get }
    ///This variable is the title of the form. It will appear at first on screen.
    var title: String { get }
    ///This variable is the subtitle of the form
    ///and represents a brief description about what is the form's porpose.
    var description: String { get }
    ///This variable will appear if the field must be filled.
    var required: Bool { get }
    ///This variable is the error message which will appear
    ///if user write something incompatible to field type.
    var validator: String? { get }
}

struct FWAnyComponent: Codable {
    var base: FWComponentModel
    /**
     Components Coding Keys.

     This enum holds all the attributes of a component.
     Used in decoding the object.
     */
    private enum CodingKeys: String, CodingKey {
        case type, base
    }

    init(_ base: FWComponentModel) {
        self.base = base
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FWAnyComponent.CodingKeys.self)

        let type = try container.decode(FWComponentType.self, forKey: .type)
        self.base = try type.metatype.init(from: decoder)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: FWAnyComponent.CodingKeys.self)
        try container.encode(type(of: base).type, forKey: .type)
        try base.encode(to: encoder)
    }
}

struct FWTextDataModel: FWComponentModel {
    static var type = FWComponentType.text

    var id: String = UUID().uuidString

    var title: String

    var description: String = ""

    var required: Bool = false

    var validator: String?

    var placeholder: String = ""

    var isMultiline: Bool = false
}
