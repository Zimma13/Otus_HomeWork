//
//  BenchmarkVCCVCell.swift
//  Otus_FirstHomeWork
//
//  Created by Zimma on 18.09.2019.
//  Copyright © 2019 Zimma. All rights reserved.
//

import UIKit

class BenchmarkVCCVCell: UICollectionViewCell, NibLoadable {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet private weak var nameOfCellLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    fileprivate var timer = Timer()
    fileprivate var timerIsOn = false
    fileprivate var elapsedTime = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 8
    }

    func setupView(cellNum: Int) {
        nameOfCellLabel.text = "Прошло времени в ячейке \(cellNum)"
        if timerIsOn {
            startOrStopTimer()
        }
        elapsedTime = 0
        timeLabel.text = "0 : 0"
    }
    
    func startOrStopTimer() {
        if timerIsOn {
            timerIsOn = false
            timer.invalidate()
        } else {
            timerIsOn = true
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        }
    }
    
    @objc fileprivate func fireTimer() {
        elapsedTime += 1
        timeLabel.text = "\(elapsedTime / 60) : \(elapsedTime % 60)"
    }
}
