//
//  FWSingleLineViewModel.swift
//  
//
//  Created by Edgar Sgroi on 05/10/20.
//

import Foundation

protocol FWSingleLineViewModelDelegate: AnyObject {
    func updateInterface()
}

final class FWSingleLineViewModel {
    
    weak var delegate: FWSingleLineViewModelDelegate?
    
    init() {
    }
    
    var content: String = "" {
        didSet {
            isValid = content.count < 6 ? false : true
        }
    }
    
    var isValid: Bool = false {
        didSet {
            print("Checking isValid")
            delegate?.updateInterface()
        }
    }
}
