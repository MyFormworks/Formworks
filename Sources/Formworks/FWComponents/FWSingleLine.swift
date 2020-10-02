//
//  FWSingleLine.swift
//  
//
//  Created by Artur Carneiro on 01/10/20.
//

import UIKit

public final class FWSingleLine: UIViewController {

    private lazy var textField: UITextField = {
        let textfield = UITextField(frame: .zero)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Type here your answer"
        textfield.borderStyle = .roundedRect
        return textfield
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = UIFont.preferredFont(forTextStyle: .title2).bold()
        return label
    }()

    private lazy var requiredLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Required"
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = .white
        label.backgroundColor = .systemRed
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()

    private lazy var titleContainerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description"
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()

    private lazy var errorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ERROR"
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .systemRed
        return label
    }()

    private lazy var layoutStackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        setUpTitleContainer()
        setUpLayoutStack()
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
