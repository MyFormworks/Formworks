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

        NSLayoutConstraint.activate([
			submitLabel.heightAnchor.constraint(equalToConstant: 50),
			submitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            submitLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            submitLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			submitLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
