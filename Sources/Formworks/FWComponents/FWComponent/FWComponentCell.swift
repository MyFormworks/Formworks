//
//  FWComponentCell.swift
//  
//
//  Created by Artur Carneiro on 13/10/20.
//

import UIKit

protocol FWComponentCell: UITableViewCell {
    static var identifier: String { get }
    func configure(with viewModel: FWComponentViewModel)
}
