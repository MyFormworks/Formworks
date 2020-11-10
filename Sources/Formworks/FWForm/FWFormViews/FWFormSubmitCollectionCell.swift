//
//  FWFormCollectionCell.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 30/09/20.
//

import UIKit

/// A representation of a `Formworks` `UITableViewCell`'s cell.
final class FWFormSubmitTableCell: UITableViewCell {

    @ManualLayout private var submitLabel: FWLabel
    
    static var identifier: String {
        return String(describing: self)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
        layoutConstraints()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        submitLabel.style(.submit)
        submitLabel.text = "Submit"
    }

    private func layoutConstraints() {
        contentView.addSubview(submitLabel)

        let guide = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            submitLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            submitLabel.topAnchor.constraint(equalTo: guide.topAnchor),
            submitLabel.widthAnchor.constraint(equalTo: guide.widthAnchor),
            submitLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
