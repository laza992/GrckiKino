//
//  NumbersCollectionViewCell.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 29.11.20..
//

import UIKit

class NumbersCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var selectionView: UIView!
    
    // MARK: - Properties
    
    static let cellID = "NumbersCollectionViewCell"
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customView.layer.borderWidth = 1
        customView.layer.borderColor = ColorName.lightGray.color.cgColor
        selectionView.layer.cornerRadius = 35
    }
    
    // MARK: - Setup Methods
    
    func setup(_ number: Int, isSelected: Bool) {
        numberLabel.text = "\(number)"
        if isSelected {
            selectionView.layer.borderWidth = 1
            selectionView.layer.borderColor = ColorName.themeYelow.color.cgColor
        } else {
            selectionView.layer.borderWidth = 0
        }
    }
}
