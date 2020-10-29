//
//  FWValidator.swift
//  
//
//  Created by Artur Carneiro on 09/10/20.
//

import Foundation


protocol FWValidator: AnyObject {
    func validate(_ content: String) -> Bool
}
