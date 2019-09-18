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
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        regusterCells()
    }
    

    fileprivate func regusterCells() {
        collectionView.register(BenchmarkVCCVCell.nib, forCellWithReuseIdentifier: BenchmarkVCCVCell.name)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        collectionView.reloadData()
    }
}

extension BenchmarkVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BenchmarkVCCVCell.name, for: indexPath) as? BenchmarkVCCVCell else { return UICollectionViewCell() }
        cell.setupView(cellNum: indexPath.row)
        return cell
    }
    
    
}

extension BenchmarkVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 50, height: 74)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 26, left: 0, bottom: 26, right: 0)
    }
}

extension BenchmarkVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? BenchmarkVCCVCell else { return }
        cell.startOrStopTimer()
        
    }
}
