//
//  ComponentSpec.swift
//  
//
//  Created by Artur Carneiro on 02/10/20.
//

import UIKit

/// Used to specificate the components settings.
enum ComponentSpec {
    
    static let componentBackgroundCornerRadius: CGFloat = 10
    static let componentBackgroundWidthMultiplier: CGFloat = 0.9
    
    static let titleLabelWidthMultiplier: CGFloat = 0.75
    static let titleLabelHeight: CGFloat = 50
    
    static let requiredLabelWidthMultiplier: CGFloat = 0.25
    static let requiredLabelHeight: CGFloat = 50
    
    static let descriptionLabelTopConstant: CGFloat = 10
    
    static let specsViewTopConstant: CGFloat = 10
    static let specsViewHeightConstant: CGFloat = 50
    
    static let errorMessageLabelTopConstant: CGFloat = 10
    
    /// Used to spacificate the `SingleLine` component.
    enum SingleLine {
        // Title container specs
        static let textFieldHeight: CGFloat = 50
    }
}
