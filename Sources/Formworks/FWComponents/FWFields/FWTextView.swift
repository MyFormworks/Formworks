//
//  FWTextView.swift
//  SampleMacro
//
//  Created by Rafael Galdino on 23/11/20.
//

import UIKit

final class FWTextView: UITextView {

    init(frame: CGRect) {
        super.init(frame: frame, textContainer: nil)
        style()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func style() {
        backgroundColor = .fwComponentInputBackground
        autocapitalizationType = .none
    }
}
