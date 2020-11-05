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
    let accent: UIColor
    let background: UIColor
    let componentBackground: UIColor
    let componentTitle: UIColor
    let componentDescription: UIColor
    let componentInputText: UIColor
    let componentInputBackground: UIColor
    let componentRequired: UIColor
    let componentCorrect: UIColor

    private enum CodingKeys: String, CodingKey {
        case accent, background, componentBackground, componentTitle, componentDescription, componentInputText, componentInputBackground, componentRequired, componentCorrect
    }

    init(accent: UIColor = .fwAccent,
                background: UIColor = .fwBackground,
                componentBackground: UIColor = .fwComponentBackground,
                componentTitle: UIColor = .fwComponentTitle,
                componentDescription: UIColor = .fwComponentDescription,
                componentInputText: UIColor = .fwComponentInputText,
                componentInputBackground: UIColor = .fwComponentInputBackground,
                componentRequired: UIColor = .fwComponentRequired,
                componentCorrect: UIColor = .fwComponentCorrect) {
        self.accent = accent
        self.background = background
        self.componentBackground = componentBackground
        self.componentTitle = componentTitle
        self.componentDescription = componentDescription
        self.componentInputText = componentInputText
        self.componentInputBackground = componentInputBackground
        self.componentRequired = componentRequired
        self.componentCorrect = componentCorrect
    }
}

extension FWStyleSpecification {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FWStyleSpecification.CodingKeys.self)
        if let color = try container.decodeIfPresent(String.self, forKey: .accent) {
            self.accent = UIColor(hex: color)
        } else {
            self.accent = .fwAccent
        }
        if let color = try container.decodeIfPresent(String.self, forKey: .background) {
            self.background = UIColor(hex: color)
        } else {
            self.background = .fwBackground
        }
        if let color = try container.decodeIfPresent(String.self, forKey: .componentBackground) {
            self.componentBackground = UIColor(hex: color)
        } else {
            self.componentBackground = .fwComponentBackground
        }
        if let color = try container.decodeIfPresent(String.self, forKey: .componentCorrect) {
            self.componentCorrect = UIColor(hex: color)
        } else {
            self.componentCorrect = .fwComponentCorrect
        }
        if let color = try container.decodeIfPresent(String.self, forKey: .componentTitle) {
            self.componentTitle = UIColor(hex: color)
        } else {
            self.componentTitle = .fwComponentTitle
        }
        if let color = try container.decodeIfPresent(String.self, forKey: .componentDescription) {
            self.componentDescription = UIColor(hex: color)
        } else {
            self.componentDescription = .fwComponentDescription
        }
        if let color = try container.decodeIfPresent(String.self, forKey: .componentInputText) {
            self.componentInputText = UIColor(hex: color)
        } else {
            self.componentInputText = .fwComponentInputText
        }
        if let color = try container.decodeIfPresent(String.self, forKey: .componentRequired) {
            self.componentRequired = UIColor(hex: color)
        } else {
            self.componentRequired = .fwComponentRequired
        }
        if let color = try container.decodeIfPresent(String.self, forKey: .componentInputBackground) {
            self.componentInputBackground = UIColor(hex: color)
        } else {
            self.componentInputBackground = .fwComponentInputBackground
        }
    }
}

fileprivate extension UIColor {
    convenience init(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...]).lowercased()

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        self.init(red: 0, green: 0, blue: 0, alpha: 0)
    }
}
