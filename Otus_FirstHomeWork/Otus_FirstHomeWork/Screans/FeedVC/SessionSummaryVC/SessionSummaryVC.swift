//
//  SessionSummaryVC.swift
//  Otus_FirstHomeWork
//
//  Created by Zimma on 16.09.2019.
//  Copyright © 2019 Zimma. All rights reserved.
//

import UIKit

class SessionSummaryVC: UIViewController {
    
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let data = self.data {
            print(data)
        }
    }

}
