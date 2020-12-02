//
//  FWComponentViewModel.swift
//  
//
//  Created by Edgar Sgroi on 15/10/20.
//

import Foundation

/// Protocol specifying the component's data structure.
protocol FWComponentViewModel {
    /// Component title value.
    var title: String { get }
    /// Component description value.
    var description: String { get }
    /// Boolean value indicating if this is a required value.
    var required: Bool { get }
    /// Boolean value indicating if the current input is valid.
    var isValid: Bool { get set }
    /// Returns an object containing all the inputs.
    func takeSnapshot() -> FWComponentSnapshot
}
