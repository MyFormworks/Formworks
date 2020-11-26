//
//  FWMultilineComponentView.swift
// 
//
//  Created by Rafael Galdino on 23/11/20.
//

import UIKit

final class FWMultilineComponentView: UITableViewCell, FWComponentCell {
    // MARK: Properties
    static var identifier: String {
        return String(describing: self)
    }

    private var viewModel: FWMultilineComponentViewModel? {
        didSet {
            if let viewModel = viewModel {
                self.titleLabel.text = viewModel.title
                self.descriptionLabel.text = viewModel.description
                self.validatorLabel.text = viewModel.validatorRuleMessage
                self.symbolImageView.isHidden = !viewModel.required
                self.textView.text = viewModel.content
            }
        }
    }

    @ManualLayout private var separatorView: UIView
    @ManualLayout private var titleLabel: FWLabel
    @ManualLayout private var descriptionLabel: FWLabel
    @ManualLayout private var validatorLabel: FWLabel
    @ManualLayout private var textView: FWTextView
    private lazy var symbolImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "asterisk.circle.fill"))
        imageView.tintColor = .fwComponentRequired
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        layoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: API
    func configure(with viewModel: FWComponentViewModel) {
        if let textViewModel = viewModel as? FWMultilineComponentViewModel {
            self.viewModel = textViewModel
            self.viewModel?.delegate = self
        }
    }

    // MARK: Views Setup
    private func setUpViews() {
        contentView.backgroundColor = .fwComponentBackground
        setUpSeparatorView()
        setUpTitleLabel()
        setUpDescriptionLabel()
        setUpValidatorLabel()
        setUpTextView()
    }

    private func setUpSeparatorView() {
        separatorView.backgroundColor = .fwBackground
    }

    private func setUpTitleLabel() {
        titleLabel.style(.title)
        titleLabel.text = ""
    }

    private func setUpDescriptionLabel() {
        descriptionLabel.style(.description)
        descriptionLabel.text = ""
    }

    private func setUpValidatorLabel() {
        validatorLabel.style(.validator)
        validatorLabel.text = "This is a test text for the validator label to see how line breaking works, and how it resizes on the view."
    }

    private func setUpTextView() {
        textView.delegate = self
    }

    // MARK: Layout
    private func layoutConstraints() {
        layoutSeparatorViewConstraints()
        layoutTitleLabelConstraints()
        layoutSymbolImageView()
        layoutDescriptionLabel()
        layoutTextView()
        layoutValidatorLabel()
    }

    private func layoutSeparatorViewConstraints() {
        self.contentView.addSubview(separatorView)

        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            separatorView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            separatorView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 12)
        ])
    }

    private func layoutTitleLabelConstraints() {
        self.contentView.addSubview(titleLabel)

        let guide = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            titleLabel.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.85)
        ])
    }

    private func layoutSymbolImageView() {
        self.contentView.addSubview(symbolImageView)

        let guide = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 16),
            symbolImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 24),
            symbolImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    private func layoutDescriptionLabel() {
        self.contentView.addSubview(descriptionLabel)

        let guide = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: guide.widthAnchor)
        ])
    }

    private func layoutTextView() {
        self.contentView.addSubview(textView)

        let guide = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            textView.widthAnchor.constraint(equalTo: guide.widthAnchor),
            textView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func layoutValidatorLabel() {
        self.contentView.addSubview(validatorLabel)

        let guide = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            validatorLabel.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 16),
            validatorLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            validatorLabel.widthAnchor.constraint(equalTo: guide.widthAnchor),
            validatorLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -8)
        ])
    }
}

// MARK: ViewModel Delegate
extension FWMultilineComponentView: FWMultilineComponentViewModelDelegate {
    func update() {
        guard let viewModel = viewModel else {
            return
        }
        switch (textView.text?.isEmpty, viewModel.isValid, viewModel.required) {
        case (false, true, true), (false, true, false):
            symbolImageView.image = UIImage(systemName: "checkmark.circle.fill")
            symbolImageView.tintColor = .fwComponentCorrect
            symbolImageView.isHidden = false
        case (false, false, true), (true, true, true), (true, false, true), (false, false, false):
            symbolImageView.image = UIImage(systemName: "asterisk.circle.fill")
            symbolImageView.tintColor = .fwComponentRequired
            symbolImageView.isHidden = false
        case (true, true, false):
            symbolImageView.image = UIImage(systemName: "checkmark.circle.fill")
            symbolImageView.tintColor = .fwComponentCorrect
            symbolImageView.isHidden = true
        case (true, false, false):
            symbolImageView.image = UIImage(systemName: "asterisk.circle.fill")
            symbolImageView.tintColor = .fwComponentRequired
            symbolImageView.isHidden = true
        default:
            break
        }
    }
}

// MARK: UITextViewDelegate
extension FWMultilineComponentView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if let viewModel = viewModel {
            viewModel.content = textView.text ?? ""
        }
    }
}
