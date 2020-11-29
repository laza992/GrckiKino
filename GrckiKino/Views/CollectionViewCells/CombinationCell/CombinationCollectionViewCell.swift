//
//  CombinationCollectionViewCell.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 29.11.20..
//

import UIKit

class CombinationCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var numberOfCombinationsLabel: UILabel!
    @IBOutlet weak var oddsLabel: UILabel!
    
    // MARK: - Properties
    
    static let cellID = "CombinationCollectionViewCell"
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Setup Methods
    
    func setup(combinationsLabel: String) {
        numberOfCombinationsLabel.text = combinationsLabel
    }

}
