//
//  FWStyleSpecification.swift
//  
//
//  Created by Cassia Aparecida Barbosa on 29/10/20.
//

import UIKit

/// The custom color style specification.
public struct FWStyleSpecification: Decodable {
	
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
}

fileprivate struct FWStyleSpecificationDTO: Decodable {
    // TODO: Determine which color is applied to each elements.
    let accent: String?
    let background: String?
    let componentBackground: String?
    let componentTitle: String?
    let componentDescription: String?
    let componentInputText: String?
    let componentInputBackground: String?
    let componentRequired: String?
    let componentCorrect: String?
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
            lhs.componentCorrect == rhs.componentCorrect
    }
}
