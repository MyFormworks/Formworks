//
//  FWBaseComponentView.swift
//  
//
//  Created by Artur Carneiro on 13/10/20.
//

import UIKit

class FWBaseComponentView: UICollectionViewCell {
    // MARK: Properties
    static var identifier: String {
        return String(describing: self)
    }

    @ManualLayout private var componentBackgroundView: UIView
    @ManualLayout private var titleLabel: FWLabel
    @ManualLayout private var descriptionLabel: FWLabel
    @ManualLayout private var errorMessageLabel: FWLabel
    @ManualLayout private var requiredLabel: FWLabel
    @ManualLayout var specsView: UIView

    var viewModel: FWBaseComponentViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
            descriptionLabel.text = viewModel?.description
            errorMessageLabel.text = viewModel?.errorMessage
            requiredLabel.text = viewModel?.required ?? true ? "Required" : ""
        }
    }

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        layoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: API
    func configure(with viewModel: FWBaseComponentViewModel) {
        self.viewModel = viewModel
    }

    // MARK: Views setup
    private func setUpViews() {
        setUpContentView()
        setUpHeader()
        setUpFooter()
    }

    private func setUpHeader() {
        titleLabel.style(.title)
        requiredLabel.style(.required)
        descriptionLabel.style(.description)
    }

    private func setUpFooter() {
        errorMessageLabel.style(.error)
    }

    /// Use this function to make all needed visual set up for the cell.
    private func setUpContentView() {
        // Add corner radius to the cell
        contentView.backgroundColor = .fwComponentBackground
        
        contentView.layer.cornerRadius = contentView.frame.height * FormSpec.Cell.cornerRadius
        contentView.clipsToBounds = true
        contentView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }

    // MARK: Layout
    private func layoutConstraints() {
        layoutHeaderConstraints()
        layoutSpecsViewConstraints()
        layoutFooterConstraints()
    }
    
    private func layoutHeaderConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(requiredLabel)
        contentView.addSubview(descriptionLabel)

        let guide = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: guide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            titleLabel.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.75),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            requiredLabel.topAnchor.constraint(equalTo: guide.topAnchor),
            requiredLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            requiredLabel.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.25),
            requiredLabel.heightAnchor.constraint(equalToConstant: 50),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: guide.widthAnchor)
        ])
    }

    private func layoutSpecsViewConstraints() {
        contentView.addSubview(specsView)

        let guide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            specsView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            specsView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            specsView.widthAnchor.constraint(equalTo: guide.widthAnchor),
            specsView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


    private func layoutFooterConstraints() {
        contentView.addSubview(errorMessageLabel)

        let guide = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: specsView.bottomAnchor, constant: 10),
            errorMessageLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            errorMessageLabel.widthAnchor.constraint(equalTo: guide.widthAnchor),
            errorMessageLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
}
