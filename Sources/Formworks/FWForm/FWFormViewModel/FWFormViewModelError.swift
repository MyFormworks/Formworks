//
//  FWFormViewModelError.swift
//  
//
//  Created by Artur Carneiro on 13/11/20.
//

import Foundation

/// Possible errors when interacting with `FWFormViewModel`.
enum FWFormViewModelError: Error {
    /// Field at index has an invalid input.
    case invalidFieldAt(IndexPath)
}

extension FWFormViewModelError {
    var localizedDescription: String {
        switch self {
        case .invalidFieldAt(let index):
            return "Invalid field at section \(index.section) : row \(index.row)."
        }
    }
}
