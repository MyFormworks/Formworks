//
//  FWTextComponentSnapshot.swift
//  
//
//  Created by Artur Carneiro on 10/11/20.
//

import Foundation

/// Snapshot of the information of a text component.
struct FWTextComponentSnapshot: FWComponentSnapshot {
    /// Component's Type.
    var component: FWComponentModelWrapper.Types {
        return .text
    }

    /// Component's Inputted Value.
    var response: String {
        return content
    }

    /// Component's ID
    let id: String
    /// Component's Title
    let title: String
    /// Component's Description
    let description: String
    /// Component's Required
    let required: Bool
    /// Component's Regular Expression
    let regex: String
    /// Component's Placeholder
    let placeholder: String
    /// Component's Content
    let content: String
}
