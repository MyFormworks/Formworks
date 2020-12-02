//
//  FWConfiguration.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 29/10/20.
//

import Foundation

/// The configuration used to create a form.
public struct FWConfiguration {

    /// The JSON provided as `Data`.
    public let json: Data
    
    /// The form's color style.
    public let style: FWStyle

    /// Initializes a FWFormViewController configuration with a custom style (if not provided by the JSON file).
    /// - Parameters:
    ///   - json: JSON Data used to create the form.
    ///   - style: The Form visual style.
    public init(json: Data, style: FWStyle) {
        self.json = json
        self.style = style
    }

    /// Initializes a FWFormViewController configuration with a light style (if not provided by the JSON file).
    /// - Parameter json: JSON Data used to create the form.
    public init(json: Data) {
        self.init(json: json, style: .light)
    }
}
