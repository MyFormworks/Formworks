//
//  FWFormCollectionView.swift
//  
//
//  Created by Edgar Sgroi on 02/10/20.
//

import UIKit

final class FWFormCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: FWFormCollectionView.setUpCollectionViewLayout())
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCollectionView() {
        register(FWFormCollectionCell.self,
                 forCellWithReuseIdentifier: FWFormCollectionCell.identifier)
        backgroundColor = .fwFormBackground
    }
    
    /// This function will set up the layout of the CollectionView. It first configure
    /// the item size that will be present on a group. And then configure
    /// the group size so it specifies the portion of the screen that will occupy
    @available(iOS 13.0, *)
    private static func setUpCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(FormSpec.itemFractionalWidth),
                                                    heightDimension: .fractionalHeight(FormSpec.itemFractionalHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(FormSpec.groupFractionalWidth),
                                                     heightDimension: .fractionalHeight(FormSpec.groupFractionalHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: FormSpec.groupSpacingTop,
                                                      leading: FormSpec.groupSpacingLeading,
                                                      bottom: FormSpec.groupSpacingBottom,
                                                      trailing: FormSpec.groupSpacingTrailing)
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}
