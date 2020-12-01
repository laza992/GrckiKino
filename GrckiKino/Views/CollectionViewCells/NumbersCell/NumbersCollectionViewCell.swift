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
        
        customView.layer.cornerRadius = 0
        customView.layer.borderWidth = 1
        customView.layer.borderColor = ColorName.lightGray.color.cgColor
        selectionView.layer.cornerRadius = customView.frame.height / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        customView.layer.cornerRadius = 0
        customView.layer.borderWidth = 1
        customView.layer.borderColor = ColorName.lightGray.color.cgColor
    }
    
    // MARK: - Setup Methods
    
    func setup(_ number: Int, isSelected: Bool) {
        numberLabel.text = "\(number)"
        customView.layer.cornerRadius = 0
        if isSelected {
            selectionView.layer.borderWidth = 1
            selectionView.layer.borderColor = ColorName.themeYelow.color.cgColor
        } else {
            selectionView.layer.borderWidth = 0
        }
    }
    
    func setupResultsCell(_ number: Int) {
        numberLabel.text = "\(number)"
        customView.layer.cornerRadius = customView.frame.height / 2
        if (1...20).contains(number) {
            customView.layer.borderWidth = 2
            customView.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        } else if (20...40).contains(number) {
            customView.layer.borderWidth = 2
            customView.layer.borderColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        } else if (40...60).contains(number) {
            customView.layer.borderWidth = 2
            customView.layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        } else if (60...80).contains(number) {
            customView.layer.borderWidth = 2
            customView.layer.borderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }
    }
}
