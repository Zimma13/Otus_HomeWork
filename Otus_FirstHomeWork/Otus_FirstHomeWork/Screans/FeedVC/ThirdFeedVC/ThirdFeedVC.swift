//
//  ThirdFeedVC.swift
//  Otus_FirstHomeWork
//
//  Created by Zimma on 08.09.2019.
//  Copyright © 2019 Zimma. All rights reserved.
//

import UIKit

class ThirdFeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func returnToRootVCButtonDidTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
