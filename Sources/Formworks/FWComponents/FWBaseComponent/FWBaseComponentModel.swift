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
protocol FWBaseComponentModel: Decodable {
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

