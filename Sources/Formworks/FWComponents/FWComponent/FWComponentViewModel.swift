//
//  FWComponentViewModel.swift
//  
//
//  Created by Edgar Sgroi on 15/10/20.
//

import Foundation

protocol FWComponentViewModel {
    var title: String { get }
    var description: String { get }
    var required: Bool { get }
    var isValid: Bool { get set }
    
    func takeSnapshot() -> FWTextComponentSnapshot
}
