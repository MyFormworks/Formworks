//
//  UIColor+Extension.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 01/10/20.
//

import UIKit

extension UIColor {
    static var style: FWStyle = .light

    /// Creates a color object from a hex string value
    /// - Parameter hex: String Hex value. Formatted in #FFFFFF
    convenience init?(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        guard hexSanitized.hasPrefix("#") else { return nil }
        
        let start = hexSanitized.index(hexSanitized.startIndex, offsetBy: 1)
        let hexColor = String(hexSanitized[start...])
        var hexNumber: UInt64 = 0
        guard
            Scanner(string: hexColor).scanHexInt64(&hexNumber)
        else { return nil }

        let r, g, b, a: CGFloat
        let lenght = hexSanitized.count
        print(lenght)
        print(hexSanitized)
        switch lenght {
        case 9:
            r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000FF) / 255
        case 7:
            r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255
            g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255
            b = CGFloat(hexNumber & 0x0000FF) / 255
            a = 1.0
        default:
            return nil
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }

    /// Returns color hex value.
    /// - Parameter alpha: Boolean value indicating wether to include alpha channel on the response.
    /// - Returns: Color hex value. Returns nil if unable convert.
    func toHex(_ alpha: Bool = false) -> String? {
        guard
            let components = cgColor.components,
            components.count >= 3
        else {
            return nil
        }
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if alpha {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }

    /// Hex value with no alpha.
    var toHex: String? {
        toHex()
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
				return UIColor(red: 253.0/255.0,
							   green: 253.0/255.0,
							   blue: 253.0/255.0,
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
    
    class var fwComponentPlaceholder: UIColor {
        switch self.style {
        case .light:
            return UIColor(red: 138.0/255.0,
                           green: 138.0/255.0,
                           blue: 138.0/255.0,
                           alpha: 1.0)
        case .dark:
            return UIColor(red: 152.0/255.0,
                           green: 152.0/255.0,
                           blue: 152.0/255.0,
                           alpha: 1.0)
        case .custom(let specification):
            return specification.componentPlaceholder
        }
        
    }
}
