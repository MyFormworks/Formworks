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
        setUpComponentBackgroundView()
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
    private func setUpComponentBackgroundView() {
        // Add corner radius to the cell
        componentBackgroundView.backgroundColor = .fwComponentBackground
        
        componentBackgroundView.layer.cornerRadius = 10
        componentBackgroundView.clipsToBounds = true
    }

    // MARK: Layout
    private func layoutConstraints() {
        layoutComponentBackgroundViewConstraints()
        layoutHeaderConstraints()
        layoutSpecsViewConstraints()
        layoutFooterConstraints()
    }
    
    private func layoutComponentBackgroundViewConstraints() {
        contentView.addSubview(componentBackgroundView)
        
        NSLayoutConstraint.activate([
            componentBackgroundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            componentBackgroundView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            componentBackgroundView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            componentBackgroundView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
    }
    
    private func layoutHeaderConstraints() {
        componentBackgroundView.addSubview(titleLabel)
        componentBackgroundView.addSubview(requiredLabel)
        componentBackgroundView.addSubview(descriptionLabel)

        let guide = componentBackgroundView.layoutMarginsGuide

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
        componentBackgroundView.addSubview(specsView)

        let guide = componentBackgroundView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            specsView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            specsView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            specsView.widthAnchor.constraint(equalTo: guide.widthAnchor),
            specsView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


    private func layoutFooterConstraints() {
        componentBackgroundView.addSubview(errorMessageLabel)

        let guide = componentBackgroundView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: specsView.bottomAnchor, constant: 10),
            errorMessageLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            errorMessageLabel.widthAnchor.constraint(equalTo: guide.widthAnchor),
            errorMessageLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
}
