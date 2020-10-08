//
//  FWSingleLineViewModel.swift
//  
//
//  Created by Edgar Sgroi on 05/10/20.
//

import Foundation

/// Delegate responsible to binding the `FWSingleLineViewModel`
/// with a `View`.
protocol FWSingleLineViewModelDelegate: AnyObject {
    func updateInterface()
}

/// The `FWSingleLine`'s  `ViewModel`.
final class FWSingleLineViewModel {
    
    weak var delegate: FWSingleLineViewModelDelegate?
    
    init() {}
    
    var content: String = "" {
        didSet {
            isValid = content.count < 6 ? false : true
        }
    }
    
    var isValid: Bool = false {
        didSet {
            delegate?.updateInterface()
        }
    }
}
