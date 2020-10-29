//
//  FWMax32Validator.swift
//  Formworks
//
//  Created by Edgar Sgroi on 29/10/20.
//

import Foundation

final class FWMax32Validator: FWValidator {
    let regexs = ["[0-9a-z._%+-]+@[a-z0-9.-]+\\.[a-z]{2,64}"]
    
    func validate(_ content: String) -> Bool {
        for regex in regexs {
            let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
            if predicate.evaluate(with: content) {
                return true
            }
        }
        return false
    }
}
