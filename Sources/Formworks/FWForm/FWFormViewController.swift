//
//  FWFormController.swift
//  
//
//  Created by Artur Carneiro on 29/09/20.
//

import UIKit

public final class FWFormViewController: UIViewController {
    // - MARK: Properties
    private lazy var formCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setUpCollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FWFormViewControllerCell.self,
                                forCellWithReuseIdentifier: FWFormViewControllerCell.identifier)
        return collectionView
    }()

    @available(iOS 13.0, *)
    private func setUpCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(FormSpec.itemFractionalWidth),
                                                    heightDimension: .fractionalHeight(FormSpec.itemFractionalHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)

        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(FormSpec.groupFractionalWidth),
                                                     heightDimension: .fractionalHeight(FormSpec.groupFractionalHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        return UICollectionViewCompositionalLayout(section: section)
    }

    //- MARK: Init
    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //- MARK: Life cycle
    public override func loadView() {
        super.loadView()
        setUpCollectionViewConstraints()
        formCollectionView.backgroundColor = .systemPink
    }

    private func setUpCollectionViewConstraints() {
        view.addSubview(formCollectionView)
        let guides = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            formCollectionView.topAnchor.constraint(equalTo: guides.topAnchor),
            formCollectionView.leftAnchor.constraint(equalTo: guides.leftAnchor),
            formCollectionView.bottomAnchor.constraint(equalTo: guides.bottomAnchor),
            formCollectionView.rightAnchor.constraint(equalTo: guides.rightAnchor)
        ])
    }
}
//- MARK: UICollectionViewDelegate
extension FWFormViewController: UICollectionViewDelegate {
    
}
//- MARL: UICollectionViewDataSource
extension FWFormViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FWFormViewControllerCell.identifier,
                                                            for: indexPath) as? FWFormViewControllerCell else {
            return UICollectionViewCell()
        }
        cell.contentView.backgroundColor = .systemRed
        return cell
    }
    
    
}
