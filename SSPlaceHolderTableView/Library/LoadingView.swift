//
//  LoadingView.swift
//  SSPlaceHolderTableView
//
//  Created by Vishal Patel on 16/01/19.
//  Copyright © 2019 Vishal Patel. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var lblLoadingTitle: UILabel!
    @IBOutlet weak var constImageCenterOffset: NSLayoutConstraint!
    
    var loadingTitleText: NSAttributedString? {
        didSet {
            lblLoadingTitle.attributedText = self.loadingTitleText
        }
    }
    
    var loadingImg: UIImage? {
        didSet {
            loadingImage.image = self.loadingImg
        }
    }
    
    class func instanceFromNib() -> LoadingView {
        let vw = UINib(nibName: "LoadingView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! LoadingView
        return vw
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        constImageCenterOffset = constImageCenterOffset.setMultiplier(multiplier: gCenterOffSetMultiplier)
    }
   
}
