//
//  FWSingleLine.swift
//  
//
//  Created by Artur Carneiro on 01/10/20.
//

import UIKit

public final class FWSingleLine: UIViewController {

    @ManualLayout private var textField: FWTextField

    @ManualLayout private var titleLabel: FWLabel

    @ManualLayout private var requiredLabel: FWLabel

    @ManualLayout private var titleContainerView: UIView

    @ManualLayout private var descriptionLabel: FWLabel

    @ManualLayout private var errorLabel: FWLabel

    @ManualLayout private var layoutStackView: UIStackView

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpTitleContainer()
        setUpLayoutStack()
    }

    private func setUpViews() {
        textField.placeholder = "Write your one-line text here"

        titleLabel.text = "One-line textfield"
        titleLabel.style(.title)

        requiredLabel.text = "Required"
        requiredLabel.style(.required)

        descriptionLabel.text = "Optional description for this field"
        descriptionLabel.style(.description)

        errorLabel.text = "If there are any errors with your input, it will appear here."
        errorLabel.style(.error)

        layoutStackView.axis = .vertical
        layoutStackView.distribution = .fillEqually
    }

    private func setUpTitleContainer() {
        titleContainerView.addSubview(titleLabel)
        titleContainerView.addSubview(requiredLabel)

        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: titleContainerView.widthAnchor,
                                              multiplier: ComponentSpec.SingleLine.titleWidthMultipler),
            titleLabel.heightAnchor.constraint(equalTo: titleContainerView.heightAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor),

            requiredLabel.widthAnchor.constraint(equalTo: titleContainerView.widthAnchor,
                                                 multiplier: ComponentSpec.SingleLine.requiredWidthMultiplier),
            requiredLabel.heightAnchor.constraint(equalTo: titleContainerView.heightAnchor,
                                                  multiplier: ComponentSpec.SingleLine.requiredHeightMultiplier),
            requiredLabel.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor)
        ])
    }

    private func setUpLayoutStack() {
        layoutStackView.addArrangedSubview(titleContainerView)
        layoutStackView.addArrangedSubview(descriptionLabel)
        layoutStackView.addArrangedSubview(textField)
        layoutStackView.addArrangedSubview(errorLabel)

        view.addSubview(layoutStackView)

        let layoutGuides = view.layoutMarginsGuide

        NSLayoutConstraint.activate([
            layoutStackView.centerXAnchor.constraint(equalTo: layoutGuides.centerXAnchor),
            layoutStackView.centerYAnchor.constraint(equalTo: layoutGuides.centerYAnchor),
            layoutStackView.widthAnchor.constraint(equalTo: layoutGuides.widthAnchor),
            layoutStackView.heightAnchor.constraint(equalTo: layoutGuides.heightAnchor)
        ])
    }

}
