//
//  BoardView.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import UIKit

class BoardView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var combinationCollectionView: UICollectionView!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var numbersTextField: TextFieldRightImageView!
    @IBOutlet weak var numbersCollectionView: UICollectionView!
    
    // MARK: - Setup Methods
    
    func setup(target: Any,
               randomSelector: Selector,
               numbersSelector: Selector,
               inuptView: UIPickerView,
               delegate: UICollectionViewDelegate,
               dataSource: UICollectionViewDataSource) {
        
        randomButton.addTarget(target, action: randomSelector, for: .touchUpInside)
    
        numbersTextField.textField.setInputViewPicker(target: target, selector: numbersSelector, inputView: inuptView)
        numbersTextField.setup(image: Asset.selectIcon.image, placeholder: "1")
        numbersTextField.textField.text = "\(1)"
        
        combinationCollectionView.delegate = delegate
        combinationCollectionView.dataSource = dataSource
        combinationCollectionView.register(UINib(nibName: CombinationCollectionViewCell.cellID, bundle: nil), forCellWithReuseIdentifier: CombinationCollectionViewCell.cellID)
        
        numbersCollectionView.delegate = delegate
        numbersCollectionView.dataSource = dataSource
        numbersCollectionView.register(UINib(nibName: NumbersCollectionViewCell.cellID, bundle: nil), forCellWithReuseIdentifier: NumbersCollectionViewCell.cellID)
    }
    
    func fill(_ drawModel: DrawingModel) {
        let time = Constants.timeFormatter.string(from: drawModel.drawTime)
        timeLabel.text = "\(time) | Kolo: \(drawModel.visualDraw)"
    }
}
