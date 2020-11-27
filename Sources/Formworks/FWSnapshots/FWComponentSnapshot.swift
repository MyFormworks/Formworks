//
//  FWComponentSnapshot.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 16/10/20.
//

import Foundation

protocol FWComponentSnapshot: Encodable {
    /// The input provided in the form.
    var response: String { get }
    /// Which kind of component is this
    var component: FWComponentModelWrapper.Types { get }
}
