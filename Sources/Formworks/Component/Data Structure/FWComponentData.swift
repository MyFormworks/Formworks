//
//  FWComponentData.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 02/10/20.
//

import Foundation

/**
 This struct represents cell's configuration.

 All variables declared here will be components presented in each cell of CollectionView.
 */
struct FWComponentData: Decodable {
    ///This variable is the title of the form. It will appear at first on screen.
    var title: String
    ///This variable is the subtitle of the form
    ///and represents a brief description about what is the form's porpose.
    var subtitle: String?
    ///This variable is the error message which will appear
    ///if user write something incompatible to field type.
    let errorMessage: String?
    ///This variable will appear if the field must be filled.
    var required: Bool
    ///This variable is the type of content that users can add in the fiel.
    var specs: FWSpecs? = nil
}

extension FWComponentData {
    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: FWComponentKeys.self)

        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
        errorMessage = try container.decodeIfPresent(String.self, forKey: .errorMessage)
        required = try container.decode(Bool.self, forKey: .required)
        specs = try FWComponentTypes.specs(from: container)
    }
}
