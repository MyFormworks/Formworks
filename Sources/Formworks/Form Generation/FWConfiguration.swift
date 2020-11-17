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
	
	public init(json: Data, style: FWStyle) {
		self.json = json
		self.style = style
	}
}
