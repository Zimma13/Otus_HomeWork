//
//  BenchmarkVC.swift
//  Otus_FirstHomeWork
//
//  Created by Zimma on 08.09.2019.
//  Copyright © 2019 Zimma. All rights reserved.
//

import UIKit

class BenchmarkVC: UIViewController {

    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hellow")
        addBehaviors(behaviors: [StartTimerInVCBehavior()])
//        addBehaviors(behaviors: [HideNavigationBarBehavior()])
    }
    
    
    @objc func runTimed() {
        print(Date())
    }

}
