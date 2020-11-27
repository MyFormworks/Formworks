//
//  FWTextComponentSnapshot.swift
//  
//
//  Created by Artur Carneiro on 10/11/20.
//

import Foundation

struct FWTextComponentSnapshot: FWComponentSnapshot {
    var component: FWComponentModelWrapper.Types {
        return .text
    }

    var response: String {
        return content
    }

    let id: String
    let title: String
    let description: String
    let required: Bool
    let regex: String
    let placeholder: String
    let content: String
}
