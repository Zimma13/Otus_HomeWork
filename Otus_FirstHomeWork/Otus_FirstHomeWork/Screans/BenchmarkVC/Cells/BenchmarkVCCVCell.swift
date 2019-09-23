//
//  BenchmarkVCCVCell.swift
//  Otus_FirstHomeWork
//
//  Created by Zimma on 18.09.2019.
//  Copyright © 2019 Zimma. All rights reserved.
//

import UIKit

class BenchmarkVCCVCell: UICollectionViewCell, NibLoadable, TimerModelDelegate {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet private weak var nameOfCellLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 8
    }
    
    func setupView(data: TimerModel, cellNum: Int) {
        nameOfCellLabel.text = "Прошло времени в ячейке \(cellNum)"
        timeLabel.text = data.stringTime
        data.delegate = self
    }
    
    func changeTime(newTime: String) {
        timeLabel.text = newTime
    }
}
