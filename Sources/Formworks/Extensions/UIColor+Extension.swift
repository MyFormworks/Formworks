//
//  UIColor+Extension.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 01/10/20.
//

import UIKit

extension UIColor {
	static var style: FWStyle = .light
    
    public convenience init?(hex: String) {
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
        return nil
    }
	
	class var fwAccent: UIColor {
		switch self.style {
			case .light:
				return UIColor(red: 108.0/255.0,
							   green: 107.0/255.0,
							   blue: 107.0/255.0,
							   alpha: 1.0)
			case .dark:
				return UIColor(red: 108.0/255.0,
							   green: 107.0/255.0,
							   blue: 107.0/255.0,
							   alpha: 1.0)
			case .custom(let specification):
				return specification.accent
		}
	}
	
	
	class var fwBackground: UIColor {
		switch self.style {
			case .light:
				return UIColor(red: 202.0/255.0,
							   green: 202.0/255.0,
							   blue: 202.0/255.0,
							   alpha: 1.0)
			case .dark:
				return UIColor(red: 33.0/255.0,
							   green: 33.0/255.0,
							   blue: 33.0/255.0,
							   alpha: 1.0)
			case .custom(let specification):
				return specification.background
		}
	}
	
	class var fwComponentBackground: UIColor {
		switch self.style {
			case .light:
				return UIColor(red: 240.0/255.0,
							   green: 240.0/255.0,
							   blue: 240.0/255.0,
							   alpha: 1.0)
			case .dark:
				return UIColor(red: 75.0/255.0,
							   green: 75.0/255.0,
							   blue: 75.0/255.0,
							   alpha: 1.0)
			case .custom(let specification):
				return specification.componentBackground
		}
	}
	
	class var fwComponentTitle: UIColor {
		switch self.style {
			case .light:
				return UIColor(red: 33.0/255.0,
							   green: 33.0/255.0,
							   blue: 33.0/255.0,
							   alpha: 1.0)
			case .dark:
				return UIColor(red: 240.0/255.0,
							   green: 240.0/255.0,
							   blue: 240.0/255.0,
							   alpha: 1.0)
			case .custom(let specification):
				return specification.componentTitle
		}
	}
	
	class var fwComponentDescription: UIColor {
		switch self.style {
			case .light:
				return UIColor(red: 33.0/255.0,
							   green: 33.0/255.0,
							   blue: 33.0/255.0,
							   alpha: 1.0)
			case .dark:
				return UIColor(red: 240.0/255.0,
							   green: 240.0/255.0,
							   blue: 240.0/255.0,
							   alpha: 1.0)
			case .custom(let specification):
				return specification.componentDescription
		}
	}

	class var fwComponentInputText: UIColor {
		switch self.style {
			case .light:
				return UIColor(red: 33.0/255.0,
							   green: 33.0/255.0,
							   blue: 33.0/255.0,
							   alpha: 1.0)
			case .dark:
				return UIColor(red: 240.0/255.0,
							   green: 240.0/255.0,
							   blue: 240.0/255.0,
							   alpha: 1.0)
			case .custom(let specification):
				return specification.componentInputText
		}
	}
	
	class var fwComponentInputBackground: UIColor {
		switch self.style {
			case .light:
				return UIColor(red: 243.0/255.0,
							   green: 243.0/255.0,
							   blue: 243.0/255.0,
							   alpha: 1.0)
			case .dark:
				return UIColor(red: 41.0/255.0,
							   green: 41.0/255.0,
							   blue: 41.0/255.0,
							   alpha: 1.0)
			case .custom(let specification):
				return specification.componentInputBackground
		}
	}
	
	class var fwComponentRequired: UIColor {
		switch self.style {
			case .light:
				return UIColor(red: 253.0/255.0,
							   green: 92.0/255.0,
							   blue: 92.0/255.0,
							   alpha: 1.0)
			case .dark:
				return UIColor(red: 253.0/255.0,
							   green: 92.0/255.0,
							   blue: 92.0/255.0,
							   alpha: 1.0)
			case .custom(let specification):
				return specification.componentRequired
		}
	}
	
	class var fwComponentCorrect: UIColor {
		switch self.style {
			case .light:
				return UIColor(red: 120.0/255.0,
							   green: 194.0/255.0,
							   blue: 86.0/255.0,
							   alpha: 1.0)
			case .dark:
				return UIColor(red: 120.0/255.0,
							   green: 194.0/255.0,
							   blue: 86.0/255.0,
							   alpha: 1.0)
			case .custom(let specification):
				return specification.componentCorrect
		}
	}
}
