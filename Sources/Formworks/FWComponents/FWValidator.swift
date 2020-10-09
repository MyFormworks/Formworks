//
//  FWValidator.swift
//  
//
//  Created by Artur Carneiro on 09/10/20.
//

import Foundation

enum FWValidator {
    case email
    case phonenumber
    case cellphone
    case max32
}

extension FWValidator {
    func regex() -> [String] {
        switch self {
        case .email:
            return ["0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}"]
        case .phonenumber:
            return ["[0-9]{2} [0-9]{8}", "[0-9]{2} [0-9]{4}-[0-9]{4}"]
        case .cellphone:
            return ["[0-9]{2} [0-9]{9}", "[0-9]{2} [0-9]{5}-[0-9]{4}"]
        case .max32:
            return ["[A-Za-z0-9 !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]{0,32}"]
        }
    }
}
