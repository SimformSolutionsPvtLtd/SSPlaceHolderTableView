//
//  ExampleListViewController.swift
//  SSPlaceHolderTableView
//
//  Created by Vishal Patel on 08/04/19.
//  Copyright © 2019 Vishal Patel. All rights reserved.
//

import UIKit

class ExampleListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ExampleListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell")
            
            return cell!
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataAvaiLableCell")
            
            return cell!
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataUnAvaiLableCell")
            
            return cell!
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "internetCell")
            
            return cell!
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "internetCell")
            
            return cell!
        }
        
    }
    
}
