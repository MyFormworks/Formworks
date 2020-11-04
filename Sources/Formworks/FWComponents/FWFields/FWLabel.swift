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
        case error
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
        case .error:
            styleError()
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
        font = UIFont.preferredFont(forTextStyle: .title2).bold()
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
    }

    private func styleDescription() {
        font = .preferredFont(forTextStyle: .subheadline)
        numberOfLines = 0
    }

    private func styleError() {
        font = .preferredFont(forTextStyle: .subheadline)
        textColor = .fwComponentRequired
        numberOfLines = 0
    }
}
