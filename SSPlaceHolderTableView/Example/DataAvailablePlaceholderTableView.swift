//
//  DataAvailablePlaceholderTableView.swift
//  SSPlaceHolderTableView
//
//  Created by Vishal Patel on 11/01/19.
//  Copyright © 2019 Vishal Patel. All rights reserved.
//

import UIKit

class DataAvailablePlaceholderTableView: UIViewController {

    @IBOutlet weak var tblView: TableView!
    var reachability: Reachability!
    var isForNoData: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tblView.centerOffSetMultiplier = 0.35      // Change multiplier if you want ot change vertical position of placeHolder Image.
        
        self.tblView.setState(.dataAvailable(viewController: self))
    }
    
}

extension DataAvailablePlaceholderTableView : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "availableCell")
        if let lbl = cell?.viewWithTag(100) as? UILabel {
            lbl.text = "\(indexPath.row)"
        }
        return cell!
    }
    
}
