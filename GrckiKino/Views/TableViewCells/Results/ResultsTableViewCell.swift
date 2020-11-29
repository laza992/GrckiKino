//
//  ResultsTableViewCell.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 29.11.20..
//

import UIKit

class ResultsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var numbersCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    static let cellID = "ResultsTableViewCell"
    var drawModel: DrawingModel?
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    // MARK: - Setup Methods
    
    func setup(_ draw: DrawingModel) {
        self.drawModel = draw
        
        let time = Constants.timeFormatter.string(from: drawModel?.drawTime ?? Date())
        timeLabel.text = "\(time) | Kolo: \(drawModel?.visualDraw ?? 0)"
        
        numbersCollectionView.delegate = self
        numbersCollectionView.dataSource = self
        numbersCollectionView.register(UINib(nibName: NumbersCollectionViewCell.cellID, bundle: nil), forCellWithReuseIdentifier: NumbersCollectionViewCell.cellID)
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ResultsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drawModel?.winningNumbers?.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumbersCollectionViewCell.cellID, for: indexPath) as! NumbersCollectionViewCell
        let number = drawModel?.winningNumbers?.list?[indexPath.row] ?? 0
        cell.setupResultsCell(number)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
