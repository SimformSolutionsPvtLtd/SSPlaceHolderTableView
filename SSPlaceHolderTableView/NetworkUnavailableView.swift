//
//  NetworkUnavailableView.swift
//  SSPlaceHolderTableView
//
//  Created by Vishal Patel on 16/01/19.
//  Copyright © 2019 Vishal Patel. All rights reserved.
//

import UIKit

class NetworkUnavailableView: UIView {

    @IBOutlet weak var noInternetImage: UIImageView!
    @IBOutlet weak var lblNoInternetTitle: UILabel!
    @IBOutlet var lblNoInternetSubtitle: UILabel!
    @IBOutlet var btnTryAgain: UIButton!
    @IBOutlet weak var constImageCenterOffset: NSLayoutConstraint!
    
    var noInternetTitleText: NSAttributedString? {
        didSet {
            lblNoInternetTitle.attributedText = self.noInternetTitleText
        }
    }
    
    var noInternetSubTitleText: NSAttributedString? {
        didSet {
            lblNoInternetSubtitle.attributedText = self.noInternetSubTitleText
        }
    }
    
    var noInternetImg: UIImage? {
        didSet {
            noInternetImage.image = self.noInternetImg
        }
    }
    
    class func instanceFromNib() -> NetworkUnavailableView {
        let vw = UINib(nibName: "NetworkUnavailableView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! NetworkUnavailableView
        return vw
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        constImageCenterOffset = constImageCenterOffset.setMultiplier(multiplier: gCenterOffSetMultiplier)
        btnTryAgain.layer.cornerRadius = 5.0
        btnTryAgain.layer.borderWidth = 1.0
        btnTryAgain.layer.borderColor = UIColor.darkGray.cgColor
    }
   
}
