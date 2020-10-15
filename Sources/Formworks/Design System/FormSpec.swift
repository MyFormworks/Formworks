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
    static let itemFractionalHeight: CGFloat = 1

    // Group layout
    static let groupFractionalWidth: CGFloat = 1
    static let groupFractionalHeight: CGFloat = 0.25
    
    // Group spacing
    static let groupSpacingTop: CGFloat = 20
    static let groupSpacingLeading: CGFloat = 20
    static let groupSpacingBottom: CGFloat = 20
    static let groupSpacingTrailing: CGFloat = 20
    
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

