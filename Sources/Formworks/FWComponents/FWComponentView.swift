//
//  FWComponentView.swift
//  
//
//  Created by Artur Carneiro on 13/10/20.
//

import UIKit

struct  FWComponentViewModel {
    let title: String
    let description: String
    let error: String
    let required: Bool
}

final class FWComponentView<Specs: UIView>: UICollectionViewCell {
    // MARK: Properties
    static var identifier: String {
        return String(describing: self)
    }

    @ManualLayout private var titleLabel: FWLabel
    @ManualLayout private var descriptionLabel: FWLabel
    @ManualLayout private var errorMessageLabel: FWLabel
    @ManualLayout private var requiredLabel: FWLabel
    @ManualLayout private var specsView: Specs

    private var viewModel: FWComponentViewModel? {
        didSet {
            viewModel.delegate = self
            titleLabel.text = viewModel?.title
            descriptionLabel.text = viewModel?.description
            errorMessageLabel.text = viewModel?.error
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
    func configure(with viewModel: FWComponentViewModel) {
        self.viewModel = viewModel
    }

    // MARK: Views setup
    private func setUpViews() {
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

    // MARK: Layout
    private func layoutConstraints() {
        layoutSpecsViewConstraints()
        layoutHeaderConstraints()
        layoutFooterConstraints()
    }

    private func layoutSpecsViewConstraints() {
        addSubview(specsView)

        let guide = layoutMarginsGuide

        NSLayoutConstraint.activate([
            specsView.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            specsView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            specsView.widthAnchor.constraint(equalTo: guide.widthAnchor)
        ])
    }

    private func layoutHeaderConstraints() {
        addSubview(titleLabel)
        addSubview(requiredLabel)
        addSubview(descriptionLabel)

        let guide = layoutMarginsGuide

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
        addSubview(errorMessageLabel)

        let guide = layoutMarginsGuide

        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: specsView.bottomAnchor,
                                                   constant: 20),
            errorMessageLabel.widthAnchor.constraint(equalTo: guide.widthAnchor),
            errorMessageLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor)
        ])
    }
}
