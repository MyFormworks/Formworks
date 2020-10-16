//
//  FWFormCollectionCell.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 30/09/20.
//

import UIKit

/// A representation of a `Formworks` `UICollectionView`'s cell.
final class FWFormSubmitCollectionCell: UICollectionViewCell {

    @ManualLayout private var submitLabel: FWLabel
    
    static var identifier: String {
        return String(describing: self)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        layoutConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        submitLabel.style(.required)
        submitLabel.text = "Submit"
    }

    private func layoutConstraints() {
        contentView.addSubview(submitLabel)

        let guide = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            submitLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            submitLabel.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            submitLabel.widthAnchor.constraint(equalToConstant: 50),
            submitLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
