//
//  FWTextView.swift
// 
//
//  Created by Rafael Galdino on 23/11/20.
//

import UIKit

/// `Formworks` custom `UITextView` implementation
final class FWTextView: UITextView {
    
    /**
     Initializes and returns a newly allocated view object with the specified frame rectangle.
     - Parameter frame: The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly.
     
     The new view object must be inserted into the view hierarchy of a window before it can be used. If you create a view object programmatically, this method is the designated initializer for the UIView class. Subclasses can override this method to perform any custom initialization but must call super at the beginning of their implementation.
     */
    init(frame: CGRect) {
        super.init(frame: frame, textContainer: nil)
        customConfiguration()
    }

    @available(*, unavailable, message: "This class should only be instatiated with ViewCode.")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customConfiguration() {
        backgroundColor = .fwComponentInputBackground
        autocapitalizationType = .none
        font = UIFont.preferredFont(forTextStyle: .body).rounded()
        textColor = .fwComponentInputText
    }
}
