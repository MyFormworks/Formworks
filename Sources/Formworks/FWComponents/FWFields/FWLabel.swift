//
//  FWLabel.swift
//  
//
//  Created by Artur Carneiro on 02/10/20.
//

import UIKit

/// A  representation of a `Formworks` label.
final class FWLabel: UILabel {
    
    /// Determines a `FWLabel` type.
    enum Style {
        case required
        case title
        case description
        case validator
        case submit
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Styles a `FWLabel`according to `Style`.
    func style(_ style: FWLabel.Style) {
        switch style {
        case .required:
            styleRequired()
        case .title:
            styleTitle()
        case .description:
            styleDescription()
        case .validator:
            styleValidator()
        case .submit:
            styleSubmit()
        }

    }

    private func styleRequired() {
        font = .preferredFont(forTextStyle: .headline)
        textColor = .fwComponentBackground
        backgroundColor = .fwAccent
        textAlignment = .center
        layer.cornerRadius = 5
        clipsToBounds = true
    }

    private func styleTitle() {
        font = UIFont.preferredFont(forTextStyle: .title3).bold().rounded()
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        numberOfLines = 3
    }

    private func styleDescription() {
        font = UIFont.preferredFont(forTextStyle: .subheadline).rounded()
        numberOfLines = 0
    }

    private func styleValidator() {
        font = UIFont.preferredFont(forTextStyle: .caption1).rounded()
        textColor = .fwComponentDescription
        numberOfLines = 0
    }

    private func styleSubmit() {
        font =  UIFont.preferredFont(forTextStyle: .body).rounded()
        textColor = .fwAccent
    }
}
