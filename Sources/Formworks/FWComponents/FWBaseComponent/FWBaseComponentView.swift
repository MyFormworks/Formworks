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
        // Add shadow drop to the cell
        contentView.layer.shadowColor = UIColor.fwComponentShadow.cgColor
        contentView.layer.shadowOffset = CGSize(width: FormSpec.Cell.cellShadowOffSetX,
                                                height: FormSpec.Cell.cellShadowOffSetY)
        contentView.layer.shadowRadius = FormSpec.Cell.cellShadowBlur
        contentView.layer.shadowOpacity = FormSpec.Cell.cellShadowOppacity
        contentView.layer.masksToBounds = false
        contentView.layer.shadowPath = UIBezierPath(roundedRect: contentView.bounds,
                                                    cornerRadius: contentView.layer.cornerRadius).cgPath
    }

    // MARK: Layout
    private func layoutConstraints() {
        layoutSpecsViewConstraints()
        layoutHeaderConstraints()
        layoutFooterConstraints()
    }

    private func layoutSpecsViewConstraints() {
        contentView.addSubview(specsView)

        let guide = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            specsView.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            specsView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            specsView.widthAnchor.constraint(equalTo: guide.widthAnchor),
            specsView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func layoutHeaderConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(requiredLabel)
        contentView.addSubview(descriptionLabel)

        let guide = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: specsView.topAnchor,
                                                     constant: -20),
            descriptionLabel.widthAnchor.constraint(equalTo: guide.widthAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor,
                                               constant: -20),
            titleLabel.widthAnchor.constraint(equalTo: guide.widthAnchor,
                                              multiplier: 0.8),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),

            requiredLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            requiredLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor,
                                                  constant: -20),
            requiredLabel.widthAnchor.constraint(equalTo: guide.widthAnchor,
                                                 multiplier: 0.2),
            requiredLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func layoutFooterConstraints() {
        contentView.addSubview(errorMessageLabel)

        let guide = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: specsView.bottomAnchor,
                                                   constant: 20),
            errorMessageLabel.widthAnchor.constraint(equalTo: guide.widthAnchor),
            errorMessageLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor)
        ])
    }
}
