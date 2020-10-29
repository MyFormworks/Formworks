//
//  FWValidator.swift
//  
//
//  Created by Artur Carneiro on 09/10/20.
//

import Foundation

/// A protocol that every validator class need to conform to validate components.
protocol FWValidator {
    /// Function used to implement the validation method.
    func validate(_ content: String) -> Bool
}
