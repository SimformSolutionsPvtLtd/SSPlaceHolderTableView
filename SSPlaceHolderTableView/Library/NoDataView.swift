//
//  NoDataView.swift
//  SSPlaceHolderTableView
//
//  Created by Vishal Patel on 16/01/19.
//  Copyright © 2019 Vishal Patel. All rights reserved.
//

import UIKit

public class NoDataView: UIView {

    @IBOutlet weak var noDataImage: UIImageView!
    @IBOutlet weak var lblNoDataTitle: UILabel!
    @IBOutlet weak var constImageCenterOffset: NSLayoutConstraint!
    
    var noDataTitleText: NSAttributedString? {
        didSet {
            lblNoDataTitle.attributedText = self.noDataTitleText
        }
    }
    
    var noDataImg: UIImage? {
        didSet {
            noDataImage.image = self.noDataImg
        }
    }
    
    class func instanceFromNib() -> NoDataView {
        let bundle = Bundle(for: self.classForCoder())
        let vw = UINib(nibName: "NoDataView", bundle: bundle).instantiate(withOwner: nil, options: nil).first as! NoDataView
        return vw
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        constImageCenterOffset = constImageCenterOffset.setMultiplier(multiplier: gCenterOffSetMultiplier)
    }
    
}
