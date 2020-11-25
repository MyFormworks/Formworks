//
//  UIFont+Extension.swift
//  
//
//  Created by Artur Carneiro on 02/10/20.
//

import UIKit

extension UIFont {
    func bold() -> UIFont {
        guard let newDescriptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }
        
        return UIFont(descriptor: newDescriptor, size: 0)
    }
    
    func rounded() -> UIFont {
        guard let newDescriptor = fontDescriptor.withDesign(.rounded) else {
            return self
        }
        
        return UIFont(descriptor: newDescriptor, size: 0)
    }
}
