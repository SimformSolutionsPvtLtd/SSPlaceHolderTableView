//
//  CollectionView.swift
//  SSPlaceHolderTableView
//
//  Created by Vishal Patel on 11/01/19.
//  Copyright © 2019 Vishal Patel. All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {
    
    var objLoadingView: LoadingView?
    var objNoDataView: NoDataView?
    var objNetworkUnavailableView: NetworkUnavailableView?
    weak var networkDelegate: networkRechabilityProtocol?

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setUpCollectionView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
        objLoadingView = LoadingView.instanceFromNib()
        objNoDataView = NoDataView.instanceFromNib()
        objNetworkUnavailableView = NetworkUnavailableView.instanceFromNib()
    }
    
    public func setState(_ state: SSPlaceHolderStates) {
        switch state {
        case .dataAvailable(let viewController):
            hideLoadinTableView(controller: viewController)
        case .noDataAvailable(let noDataImg, let noDataLabelTitle):
            showNoDataPlaceHolder(noDataImg: noDataImg, noDataLabelTitle: noDataLabelTitle, customView: nil)
        case .noDataAvailableWithCustomView(let customView):
            showNoDataPlaceHolder(noDataImg: nil, noDataLabelTitle: nil, customView: customView)
        case .loading(let img, let title):
            showLoadingTableView(loadingImg: img, loadingLabelTitle: title, customView: nil)
        case .loadingWithCustomView(let customView):
            showLoadingTableView(loadingImg: nil, loadingLabelTitle: nil, customView: customView)
        case .checkInternetAvaibility(let noInternetImg, let noInternetLabelTitle):
            checkInternetAndShowView(noInternetImg: noInternetImg, noInternetLabelTitle: noInternetLabelTitle, customView: nil)
        case .checkInternetAvaibilityCustomView(let customView):
            checkInternetAndShowView(noInternetImg: nil, noInternetLabelTitle: nil, customView: customView)
        default: break
            
        }
    }
    
    private func showLoadingTableView(loadingImg: UIImage?, loadingLabelTitle: NSAttributedString?, customView: UIView?) {
        if customView != nil {
            self.backgroundView = customView
        } else {
            objLoadingView?.loadingTitleText = loadingLabelTitle ?? "Please Wait...".makeAttributedString(font: UIFont.systemFont(ofSize: 25), textColor: .lightGray)
            objLoadingView?.loadingImg = loadingImg ?? UIImage(named: "simformLogo")
            self.backgroundView = objLoadingView
        }
        self.dataSource = nil
        self.delegate = nil
    }
    
    private func hideLoadinTableView(controller: UIViewController) {
        self.dataSource = (controller as! UICollectionViewDataSource)
        self.delegate = (controller as! UICollectionViewDelegate)
        self.backgroundView = nil
        self.reloadData()
    }
    
    private func showNoDataPlaceHolder(noDataImg: UIImage?, noDataLabelTitle: NSAttributedString?, customView: UIView?) {
        if customView != nil {
            self.backgroundView = customView
        } else {
            objNoDataView?.noDataTitleText = noDataLabelTitle ?? "NO DATA FOUND.".makeAttributedString(font: UIFont.systemFont(ofSize: 25), textColor: .lightGray)
            objNoDataView?.noDataImg = noDataImg ?? UIImage(named: "simformLogo")
            self.backgroundView = objNoDataView
        }
        self.dataSource = nil
        self.delegate = nil
    }
    
    private func checkInternetAndShowView(noInternetImg: UIImage?, noInternetLabelTitle: NSAttributedString?, customView: UIView?) {
        if customView != nil {
            self.backgroundView = customView
        } else {
            objNetworkUnavailableView?.noInternetTitleText = noInternetLabelTitle ?? "NO    INTERNET".makeAttributedString(font: UIFont.systemFont(ofSize: 25), textColor: .lightGray)
            objNetworkUnavailableView?.noInternetImg = noInternetImg ?? UIImage(named: "noInternet")
            objNetworkUnavailableView?.btnTryAgain.addTarget(self, action: #selector(retryButtonTapped(sender:)),   for: .touchUpInside)
            self.backgroundView = objNetworkUnavailableView
        }
        self.dataSource = nil
        self.delegate = nil
    }

    @objc func retryButtonTapped(sender: UIButton) {
        networkDelegate?.retryNetworkCall()
    }
}
extension String {
    func makeAttributedString(font: UIFont, textColor: UIColor) -> NSAttributedString {
        let attriString = NSAttributedString(string:self, attributes:
            [NSAttributedString.Key.foregroundColor: textColor,
             NSAttributedString.Key.font: font])
        return attriString
    }
}
