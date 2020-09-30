//
//  FWFormViewControllerCell.swift
//  
//
//  Created by Victor Falcetta do Nascimento on 30/09/20.
//

import UIKit

final class FWFormViewControllerCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpContentView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpContentView() {
        contentView.backgroundColor = .systemGray4
        contentView.layer.cornerRadius = contentView.frame.height * FormSpec.Cell.cornerRadius
        contentView.clipsToBounds = true
    }
}
