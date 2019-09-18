//
//  ViewController.swift
//  Otus_FirstHomeWork
//
//  Created by Zimma on 29.08.2019.
//  Copyright © 2019 Zimma. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "FeedVCToSessionSummaryVC" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationVC = segue.destination as! SessionSummaryVC
                destinationVC.data = "Item \(indexPath.row)"
            }
        }
    }
    
}

extension FeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "Item \(indexPath.row)"
        return cell
    }
    
    
    
}

extension FeedVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "FeedVCToSessionSummaryVC", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

