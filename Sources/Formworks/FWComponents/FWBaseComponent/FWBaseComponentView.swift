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
    private lazy var requiredImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "circle.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    @ManualLayout var specsView: UIView

    var viewModel: FWBaseComponentViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
            descriptionLabel.text = viewModel?.description
            errorMessageLabel.text = viewModel?.errorMessage
            requiredImage.isHidden = viewModel?.required ?? false ? false : true
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
//        setUpFooter()
    }

    private func setUpHeader() {
        titleLabel.style(.title)
        requiredImage.tintColor = .fwRequired
        descriptionLabel.style(.description)
    }

    private func setUpFooter() {
        errorMessageLabel.style(.error)
    }

    /// Use this function to make all needed visual set up for the cell.
    private func setUpComponentBackgroundView() {
        // Add corner radius to the cell
        componentBackgroundView.backgroundColor = .fwComponentBackground
        
        componentBackgroundView.layer.cornerRadius = ComponentSpec.componentBackgroundCornerRadius
        componentBackgroundView.clipsToBounds = true
    }

    // MARK: Layout
    private func layoutConstraints() {
        layoutComponentBackgroundViewConstraints()
        layoutHeaderConstraints()
        layoutSpecsViewConstraints()
//        layoutFooterConstraints()
    }
    
    private func layoutComponentBackgroundViewConstraints() {
        contentView.addSubview(componentBackgroundView)
        
        NSLayoutConstraint.activate([
            componentBackgroundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            componentBackgroundView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            componentBackgroundView.widthAnchor.constraint(equalTo: contentView.widthAnchor,
                                                           multiplier: ComponentSpec.componentBackgroundWidthMultiplier),
            componentBackgroundView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
    }
    
    private func layoutHeaderConstraints() {
        componentBackgroundView.addSubview(titleLabel)
        componentBackgroundView.addSubview(requiredImage)
        componentBackgroundView.addSubview(descriptionLabel)

        let guide = componentBackgroundView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: guide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            titleLabel.widthAnchor.constraint(equalTo: guide.widthAnchor,
                                              multiplier: ComponentSpec.titleLabelWidthMultiplier),
            titleLabel.heightAnchor.constraint(equalToConstant: ComponentSpec.titleLabelHeight),
            
            requiredImage.topAnchor.constraint(equalTo: guide.topAnchor),
            requiredImage.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            requiredImage.widthAnchor.constraint(equalTo: guide.widthAnchor, multiplier: ComponentSpec.requiredLabelWidthMultiplier),
            requiredImage.heightAnchor.constraint(equalTo: guide.widthAnchor,
                                                  multiplier: ComponentSpec.requiredLabelWidthMultiplier),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ComponentSpec.descriptionLabelTopConstant),
            descriptionLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: guide.widthAnchor)
        ])
    }

    private func layoutSpecsViewConstraints() {
        componentBackgroundView.addSubview(specsView)

        let guide = componentBackgroundView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            specsView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: ComponentSpec.specsViewTopConstant),
            specsView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            specsView.widthAnchor.constraint(equalTo: guide.widthAnchor),
            specsView.heightAnchor.constraint(equalToConstant: ComponentSpec.specsViewHeightConstant)
        ])
    }


    private func layoutFooterConstraints() {
        componentBackgroundView.addSubview(errorMessageLabel)

        let guide = componentBackgroundView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: specsView.bottomAnchor, constant: ComponentSpec.errorMessageLabelTopConstant),
            errorMessageLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            errorMessageLabel.widthAnchor.constraint(equalTo: guide.widthAnchor),
            errorMessageLabel.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
}
