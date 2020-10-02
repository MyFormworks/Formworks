//
//  FWLabel.swift
//  
//
//  Created by Artur Carneiro on 02/10/20.
//

import UIKit

final class FWLabel: UILabel {

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
        font = .preferredFont(forTextStyle: .footnote)
        textColor = .white
        backgroundColor = .systemRed
        textAlignment = .center
        layer.cornerRadius = 5
        clipsToBounds = true
    }

    private func styleTitle() {
        font = UIFont.preferredFont(forTextStyle: .title2).bold()
    }

    private func styleDescription() {
        font = .preferredFont(forTextStyle: .subheadline)
    }

    private func styleError() {
        font = .preferredFont(forTextStyle: .subheadline)
        textColor = .systemRed
    }
}
