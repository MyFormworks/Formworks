//
//  FormSpec.swift
//  
//
//  Created by Artur Carneiro on 29/09/20.
//

import UIKit

/**
 Numerical values used to create the visual of the CollectionView,
 such as the cell size, group size.
 */
enum FormSpec {
    // MARK: UICollectionViewCompositionalLayout
    // Item layout
    static let itemFractionalWidth: CGFloat = 1
    static let itemEstimatedHeight: CGFloat = 120

    // Group layout
    static let groupFractionalWidth: CGFloat = 1
    static let groupEstimatedHeight: CGFloat = 200
    
    // Group spacing
    static let groupSpacing: CGFloat = 20
    
    /// Visual aspects of the CollectionViewCell,  such as adding corner radius.
    enum Cell {
        // Cell corner radius
        static let cornerRadius: CGFloat = 0.05
        // Cell shadow
        static let cellShadowBlur: CGFloat = 6
        static let cellShadowOffSetY: CGFloat = 5
        static let cellShadowOffSetX: CGFloat = 1
        static let cellShadowOppacity: Float = 0.35
        
    }
}

