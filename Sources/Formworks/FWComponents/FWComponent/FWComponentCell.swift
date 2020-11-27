//
//  FWComponentCell.swift
//  
//
//  Created by Artur Carneiro on 13/10/20.
//

import UIKit

protocol FWComponentCell: UITableViewCell {
    /// Component class cell identifier.
    static var identifier: String { get }
    /// Component cell behaviour configuration.
    /// - Parameter viewModel: The viewModel that will be linked to this view.
    func configure(with viewModel: FWComponentViewModel)
}
