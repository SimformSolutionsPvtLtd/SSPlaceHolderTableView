//
//  LoadingTableView.swift
//  SSPlaceHolderTableView
//
//  Created by Vishal Patel on 11/01/19.
//  Copyright © 2019 Vishal Patel. All rights reserved.
//

import UIKit

class LoadingTableView: UIViewController {

    @IBOutlet weak var tblView: TableView!
    
    var reachability: Reachability!
    var isForNoData: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tblView.centerOffSetMultiplier = 0.35      // Change multiplier if you want ot change vertical position of placeHolder Image.
        
        /// - parameter loadingImg: Set Your own loading Image instead use default image.
        /// - parameter loadingLabelTitle: Set Your own loading title instead use default title.
        self.tblView.setState(.loading(loadingImg: nil, loadingLabelTitle: nil))
    }

}
