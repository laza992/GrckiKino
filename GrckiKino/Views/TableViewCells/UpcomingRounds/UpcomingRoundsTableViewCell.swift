//
//  UpcomingRoundsTableViewCell.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import UIKit

class UpcomingRoundsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var drawingTimeLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    // MARK: - Properties
    
    static let cellID = "UpcomingRoundsTableViewCell"
    var timer: Timer!
    var seconds = 300
    var indexPath: IndexPath?
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        timer?.invalidate()
        timer = nil
        seconds = 300
    }
    
    // MARK: - Setup Methods
    
    func setup(_ drawModel: DrawingModel, indexPath: IndexPath) {
        self.indexPath = indexPath
        
        seconds = seconds * (indexPath.row + 1)
        drawingTimeLabel.text = Constants.timeFormatter.string(from: drawModel.drawTime)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDownDate), userInfo: nil, repeats: true)
    }

    // MARK: - Actions
    
    @objc private func countDownDate() {
        
        if seconds > 0 {
            let hours = Int(seconds) / 3600
            let minutes = Int(seconds) / 60 % 60
            let second = Int(seconds) % 60
            
            if seconds > 3600 {
                remainingTimeLabel.text = String(format:"%02i:%02i:%02i", hours, minutes, second)
            } else {
                remainingTimeLabel.text = String(format:"%02i:%02i", minutes, second)
            }
            
            remainingTimeLabel.textColor = seconds < 60 ? .red : .white
           
            seconds-=1
        }
    }
}
