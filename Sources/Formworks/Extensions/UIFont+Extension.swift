import UIKit

extension UIFont {
    /// Returns the bold face of the this font, if avaiable.
    /// - Returns: Bold face of the this font.
    func bold() -> UIFont {
        guard let newDescriptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }
        
        return UIFont(descriptor: newDescriptor, size: 0)
    }

    /// Returns the rounded face of the this font, if avaiable.
    /// - Returns: Rounded face of the this font.
    func rounded() -> UIFont {
        guard let newDescriptor = fontDescriptor.withDesign(.rounded) else {
            return self
        }
        
        return UIFont(descriptor: newDescriptor, size: 0)
    }
}
