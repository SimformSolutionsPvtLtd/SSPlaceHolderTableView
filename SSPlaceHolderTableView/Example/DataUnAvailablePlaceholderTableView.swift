//
//  DataUnAvailablePlaceholderTableView.swift
//  SSPlaceHolderTableView
//
//  Created by Vishal Patel on 11/01/19.
//  Copyright © 2019 Vishal Patel. All rights reserved.
//

import UIKit

class DataUnAvailablePlaceholderTableView: UIViewController {

    @IBOutlet weak var tblView: TableView!
    var reachability: Reachability!
    var isForNoData: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tblView.centerOffSetMultiplier = 0.35      // Change multiplier if you want ot change vertical position of placeHolder Image.
        
        /// - parameter noDataImg: Set Your own No Data state Image instead use default image.
        /// - parameter noDataLabelTitle: Set Your own No data State title instead use default title.
         self.tblView.setState(.noDataAvailable(noDataImg: nil, noDataLabelTitle: nil))
    }
}
