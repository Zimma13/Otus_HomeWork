//
//  CustomViewInSplitView.swift
//  Otus_FirstHomeWork
//
//  Created by Zimma on 03.09.2019.
//  Copyright © 2019 Zimma. All rights reserved.
//

import UIKit

class CustomViewInSplitView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        contentView.layer.cornerRadius = contentView.frame.height / 2
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        Bundle.main.loadNibNamed("CustomViewInSplitView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.backgroundColor = UIColor.purple
        
    }
    
}
