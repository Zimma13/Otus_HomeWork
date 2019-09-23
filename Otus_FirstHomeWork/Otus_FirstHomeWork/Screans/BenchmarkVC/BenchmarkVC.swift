//
//  BenchmarkVC.swift
//  Otus_FirstHomeWork
//
//  Created by Zimma on 08.09.2019.
//  Copyright © 2019 Zimma. All rights reserved.
//

import UIKit

class BenchmarkVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var timerModels: [TimerModel] = []
    
    fileprivate enum Layout {
        case table
        case grid
    }
    
    fileprivate var layout: Layout = .table
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        regusterCells()
        setData()
        updateCVLayout()
    }
    
    fileprivate func setData() {
        for _ in 0...5 {
            let timer = TimerModel()
            timerModels.append(timer)
        }
    }

    fileprivate func regusterCells() {
        collectionView.register(BenchmarkVCCVCell.nib, forCellWithReuseIdentifier: BenchmarkVCCVCell.name)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timerModels.forEach { $0.timerIsOn = false }
    }
    
    fileprivate func updateCVLayout() {
        switch layout {
        case .grid:
            let newLayout = GridCVLayout()
            newLayout.delegate = self
            collectionView.setCollectionViewLayout(newLayout, animated: true)
        case .table:
            let newLayout = SimplyTableCVLayout()
            collectionView.setCollectionViewLayout(newLayout, animated: true)
        }
    }
    
    @IBAction func updateCVLayout(_ sender: Any) {
        layout = layout == .table ? .grid : .table
        updateCVLayout()
    }
    
}

extension BenchmarkVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timerModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenchmarkVCCVCell.name, for: indexPath) as? BenchmarkVCCVCell else { return UICollectionViewCell() }
        
        cell.setupView(data: timerModels[indexPath.row], cellNum: indexPath.row)
        
        return cell
    }
}

extension BenchmarkVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        timerModels[indexPath.row].timerIsPaused = !timerModels[indexPath.row].timerIsPaused
    }
}

extension BenchmarkVC: CustomCollectionViewDelegate {
    func numberOfItemsInCollectionView() -> Int {
        return timerModels.count
    }
}
