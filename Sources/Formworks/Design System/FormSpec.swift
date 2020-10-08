//
//  FormSpec.swift
//  
//
//  Created by Artur Carneiro on 29/09/20.
//

import UIKit

/// This enum is used to specify all the numerical values used to
/// create the visual of the CollectionView, such as the cell size,
/// group size.
enum FormSpec {
    // -MARK: UICollectionViewCompositionalLayout
    // Item layout
    static let itemFractionalWidth: CGFloat = 1
    static let itemFractionalHeight: CGFloat = 1

    // Group layout
    static let groupFractionalWidth: CGFloat = 1
    static let groupFractionalHeight: CGFloat = 0.2
    
    // Group spacing
    static let groupSpacingTop: CGFloat = 16
    static let groupSpacingLeading: CGFloat = 16
    static let groupSpacingBottom: CGFloat = 16
    static let groupSpacingTrailing: CGFloat = 16
    
    /// This enum is used to configure specific visual aspects of
    /// the CollectionViewCell,  such as adding corner radius.
    enum Cell {
        // Cell corner radius
        static let cornerRadius: CGFloat = 0.05
        // Cell shadow
        static let cellShadowBlur: CGFloat = 10
        static let cellShadowOffSetY: CGFloat = 4
        static let cellShadowOffSetX: CGFloat = 2
        static let cellShadowOppacity: Float = 0.25
        
    }
}

