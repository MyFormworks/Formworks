//
//  FWTextComponentView.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 05/11/20.
//

import UIKit

final class FWTextComponentView: UITableViewCell, FWComponentCell {
    // MARK: Properties
    static var identifier: String {
        return String(describing: self)
    }
    
    private var viewModel: FWTextComponentViewModel? {
        didSet {
            if let viewModel = viewModel {
                self.titleLabel.text = viewModel.title
                self.descriptionLabel.text = viewModel.description
                self.validatorLabel.text = viewModel.validatorRuleMessage
                self.textField.placeholder = viewModel.placeholder
                self.symbolImageView.isHidden = !viewModel.required
                switch viewModel.type {
                case .text, .multiline:
                    self.textField.keyboardType = .default
                case .numerical:
                    self.textField.keyboardType = .numberPad
                case .phonenumber:
                    self.textField.keyboardType = .phonePad
                case .email:
                    self.textField.keyboardType = .emailAddress
                }
            }
        }
    }
    
    @ManualLayout private var separatorView: UIView
    @ManualLayout private var titleLabel: FWLabel
    @ManualLayout private var descriptionLabel: FWLabel
    @ManualLayout private var validatorLabel: FWLabel
    @ManualLayout private var textField: FWTextField
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
        if let textViewModel = viewModel as? FWTextComponentViewModel {
            self.viewModel = textViewModel
            self.viewModel?.delegate = self
        }
    }
    
    // MARK: @objc
    @objc private func didEditingChange(_ textField: FWTextField) {
        if let viewModel = viewModel {
            viewModel.content = textField.text ?? ""
        }
    }
    
    // MARK: Views Setup
    private func setUpViews() {
        contentView.backgroundColor = .fwComponentBackground
        setUpSeparatorView()
        setUpTitleLabel()
        setUpDescriptionLabel()
        setUpValidatorLabel()
        setUpTextField()
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
    
    private func setUpTextField() {
        textField.placeholder = ""
        textField.addTarget(self, action: #selector(didEditingChange(_:)), for: .editingChanged)
    }
    
    // MARK: Layout
    private func layoutConstraints() {
        layoutSeparatorViewConstraints()
        layoutTitleLabelConstraints()
        layoutSymbolImageView()
        layoutDescriptionLabel()
        layoutTextField()
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
    
    private func layoutTextField() {
        self.contentView.addSubview(textField)
        
        let guide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            textField.widthAnchor.constraint(equalTo: guide.widthAnchor),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func layoutValidatorLabel() {
        self.contentView.addSubview(validatorLabel)
        
        let guide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            validatorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            validatorLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            validatorLabel.widthAnchor.constraint(equalTo: guide.widthAnchor),
            validatorLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -8)
        ])
    }
}

// MARK: ViewModel Delegate
extension FWTextComponentView: FWTextComponentViewModelDelegate {
    func update() {
        guard let viewModel = viewModel else {
            return
        }
        if !viewModel.required {
            symbolImageView.isHidden = textField.text == nil
        }
        if viewModel.isValid {
            symbolImageView.image = UIImage(systemName: "checkmark.circle.fill")
            symbolImageView.tintColor = .fwComponentCorrect
        } else {
            symbolImageView.image = UIImage(systemName: "asterisk.circle.fill")
            symbolImageView.tintColor = .fwComponentRequired
        }
    }
}
