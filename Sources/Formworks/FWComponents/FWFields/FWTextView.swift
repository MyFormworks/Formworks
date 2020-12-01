//
//  FWTextView.swift
// 
//
//  Created by Rafael Galdino on 23/11/20.
//

import UIKit

final class FWTextView: UITextView {

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
        isScrollEnabled = false
    }
}
