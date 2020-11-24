//
//  FWStyleSpecification.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 29/10/20.
//

import UIKit

/// The custom color style specification.
public struct FWStyleSpecification: Codable {
	
    // TODO: Determine which color is applied to each elements.
    var accent: UIColor = .fwAccent
    var background: UIColor = .fwBackground
    var componentBackground: UIColor = .fwComponentBackground
    var componentTitle: UIColor = .fwComponentTitle
    var componentDescription: UIColor = .fwComponentDescription
    var componentInputText: UIColor = .fwComponentInputText
    var componentInputBackground: UIColor = .fwComponentInputBackground
    var componentRequired: UIColor = .fwComponentRequired
    var componentCorrect: UIColor = .fwComponentCorrect
    var componentPlaceholder: UIColor = .fwComponentPlaceholder
}

fileprivate struct FWStyleSpecificationDTO: Codable {
    let accent: String?
    let background: String?
    let componentBackground: String?
    let componentTitle: String?
    let componentDescription: String?
    let componentInputText: String?
    let componentInputBackground: String?
    let componentRequired: String?
    let componentCorrect: String?
    let componentPlaceholder: String?
}

extension FWStyleSpecification: Equatable {
    public init(from decoder: Decoder) throws {
        let dto = try FWStyleSpecificationDTO.init(from: decoder)
        self.accent = UIColor(hex: dto.accent ?? "") ?? .fwAccent
        self.background = UIColor(hex: dto.background ?? "") ?? .fwBackground
        self.componentBackground = UIColor(hex: dto.componentBackground ?? "") ?? .fwComponentBackground
        self.componentTitle = UIColor(hex: dto.componentTitle ?? "") ?? .fwComponentTitle
        self.componentDescription = UIColor(hex: dto.componentDescription ?? "") ?? .fwComponentDescription
        self.componentInputText = UIColor(hex: dto.componentInputText ?? "") ?? .fwComponentInputText
        self.componentInputBackground = UIColor(hex: dto.componentInputBackground ?? "") ?? .fwComponentInputBackground
        self.componentRequired = UIColor(hex: dto.componentRequired ?? "") ?? .fwComponentRequired
        self.componentCorrect = UIColor(hex: dto.componentCorrect ?? "") ?? .fwComponentCorrect
        self.componentPlaceholder = UIColor(hex: dto.componentPlaceholder ?? "") ?? .fwComponentPlaceholder
    }

    public func encode(to encoder: Encoder) throws {
        let dto = FWStyleSpecificationDTO(
            accent: self.accent.toHex(true),
            background: self.background.toHex(true),
            componentBackground: self.componentBackground.toHex(true),
            componentTitle: self.componentTitle.toHex(true),
            componentDescription: self.componentDescription.toHex(true),
            componentInputText: self.componentInputText.toHex(true),
            componentInputBackground: self.componentInputBackground.toHex(true),
            componentRequired: self.componentRequired.toHex(true),
            componentCorrect: self.componentCorrect.toHex(true),
            componentPlaceholder: self.componentPlaceholder.toHex(true)
        )
        try dto.encode(to: encoder)
    }
    
    public static func ==(lhs: FWStyleSpecification, rhs: FWStyleSpecification) -> Bool {
        return lhs.accent == rhs.accent &&
            lhs.background == rhs.background &&
            lhs.componentBackground == rhs.componentBackground &&
            lhs.componentTitle == rhs.componentTitle &&
            lhs.componentDescription == rhs.componentDescription &&
            lhs.componentInputText == rhs.componentInputText &&
            lhs.componentInputBackground == rhs.componentInputBackground &&
            lhs.componentRequired == rhs.componentRequired &&
            lhs.componentCorrect == rhs.componentCorrect &&
            lhs.componentPlaceholder == rhs.componentPlaceholder
    }
}
