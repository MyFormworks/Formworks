//
//  FWSingleLineModel.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 03/11/20.
//

import Foundation
struct FWTextModel: FWBaseComponentModel {
    var id: String = UUID().uuidString
    var title: String
    var description: String = ""
    var required: Bool = false
    var validator: String?
    var placeholder: String = ""
    var isMultiline: Bool = false
}
