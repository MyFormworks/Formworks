//
//  FWTextComponentView.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 05/11/20.
//

import UIKit

public final class FWTextComponentView: UITableViewCell, FWComponentCell {
    // MARK: Properties
    public static var identifier: String {
        return String(describing: self)
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
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: API
    func configure(with viewModel: FWComponentViewModel) {
        return
    }
    
    public func test(string: String) {
        validatorLabel.text = string
    }
    
    // MARK: @objc
    @objc private func didEditingChange(_ textField: FWTextField) {
        
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
        titleLabel.text = "A very very big title so we can se how the line breaking really really works"
    }
    
    private func setUpDescriptionLabel() {
        descriptionLabel.style(.description)
        descriptionLabel.text = "This is a description for testing purposes so it will be able to see how the line breaking is working. Therefore, any errors we can make adjustments."
    }
    
    private func setUpValidatorLabel() {
        validatorLabel.style(.validator)
        validatorLabel.text = "This is a test text for the validator label to see how line breaking works, and how it resizes on the view."
    }
    
    private func setUpTextField() {
        textField.placeholder = "This is a placeholder for the test"
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
            separatorView.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func layoutTitleLabelConstraints() {
        self.contentView.addSubview(titleLabel)
        
        let guide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            titleLabel.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 0.80)
        ])
    }
    
    private func layoutSymbolImageView() {
        self.contentView.addSubview(symbolImageView)
        
        let guide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: guide.topAnchor),
            symbolImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 30),
            symbolImageView.heightAnchor.constraint(equalToConstant: 30)
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
            textField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            textField.widthAnchor.constraint(equalTo: guide.widthAnchor),
            textField.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func layoutValidatorLabel() {
        self.contentView.addSubview(validatorLabel)
        
        let guide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            validatorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8),
            validatorLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            validatorLabel.widthAnchor.constraint(equalTo: guide.widthAnchor),
            validatorLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -8)
        ])
    }
}
