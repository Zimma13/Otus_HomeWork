//
//  SimplyTableCVLayout.swift
//  Otus_FirstHomeWork
//
//  Created by Zimma on 23.09.2019.
//  Copyright © 2019 Zimma. All rights reserved.
//

import UIKit

class SimplyTableCVLayout: UICollectionViewLayout {
    
//    var itemSize: CGSize?
//    var sectionInset: UIEdgeInsets?
//
//    override public var collectionViewContentSize: CGSize {
//        guard let cv = collectionView else { return .zero }
//        return CGSize(width: cv.bounds.width - 20, height: 75)
//    }
//
//    override func prepare() {
//        super.prepare()
//
//        guard let collectionView = collectionView else { return }
//
//        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
//
//        let cellWidth = availableWidth - 20
//
//        self.itemSize = CGSize(width: cellWidth, height: 75)
//        self.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
//
//
//    }
    
    
    var itemSize = CGSize(width: 200, height: 150)
    var attributesList = [UICollectionViewLayoutAttributes]()

    override func prepare() {
        super.prepare()
        
        guard let cv = collectionView else { return }
        
        let itemNo = cv.numberOfItems(inSection: 0)
        let width = (cv.frame.width - 40)
        itemSize = CGSize(width: width, height: 75)

        attributesList = (0..<itemNo).map { (i) -> UICollectionViewLayoutAttributes in
            let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: i, section: 0))

            attributes.size = self.itemSize
            attributes.frame = CGRect(x: 0, y: 0, width: itemSize.width, height: itemSize.height)
            let x: CGFloat = 20
            let y = CGFloat(i) * (itemSize.height + 10) + 10
            
            attributes.frame = CGRect(x: x, y: y, width: itemSize.width, height: itemSize.height)

            return attributes
        }
    }

    override var collectionViewContentSize : CGSize {
        guard let cv = collectionView else { return .zero }
        return CGSize(width: cv.bounds.width, height: itemSize.height)
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesList
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if indexPath.row < attributesList.count
        {
            return attributesList[indexPath.row]
        }
        return nil
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
