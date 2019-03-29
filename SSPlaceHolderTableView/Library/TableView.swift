//
//  TableView.swift
//  SSPlaceHolderTableView
//
//  Created by Vishal Patel on 11/01/19.
//  Copyright © 2019 Vishal Patel. All rights reserved.
//

import UIKit

public enum SSPlaceHolderStates {
    case dataAvailable(viewController: UIViewController)
    case noDataAvailable(noDataImg: UIImage?, noDataLabelTitle: NSAttributedString?)
    case noDataAvailableWithCustomView(_ customView: UIView?)
    case loading(loadingImg: UIImage?, loadingLabelTitle: NSAttributedString?)
    case loadingWithCustomView(_ customView: UIView?)
    case checkInternetAvaibility(noInternetImg: UIImage?, noInternetLabelTitle: NSAttributedString?)
    case checkInternetAvaibilityCustomView(_ customView: UIView?)
    case unknown
}

protocol networkRechabilityProtocol: class {
    func retryNetworkCall()
}
var gCenterOffSetMultiplier: CGFloat = 0.75

class TableView: UITableView {
    
    private var objLoadingView: LoadingView?
    private var objNoDataView: NoDataView?
    private var objNetworkUnavailableView: NetworkUnavailableView?
    var centerOffSetMultiplier: CGFloat? {
        didSet {
            gCenterOffSetMultiplier = centerOffSetMultiplier ?? 0.75
        }
    }
    var networkUnReachableBlock: (() -> Void)?
    
    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setUpTableView()
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
        setUpTableView()
    }
    
    private func setUpTableView() {
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
        objLoadingView?.loadingTitleText = loadingLabelTitle ?? "Please Wait...".makeAttributedString(font: UIFont.systemFont(ofSize: 25), textColor: .lightGray)
        objLoadingView?.loadingImg = loadingImg ?? UIImage(named: "simformLogo")
        self.backgroundView = objLoadingView
        self.separatorColor = UIColor.clear
        self.dataSource = nil
        self.delegate = nil
    }
    
    private func hideLoadinTableView(controller: UIViewController) {
        self.dataSource = (controller as! UITableViewDataSource)
        self.delegate = (controller as! UITableViewDelegate)
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
        self.separatorColor = UIColor.clear
        self.dataSource = nil
        self.delegate = nil
    }
    
    private func checkInternetAndShowView(noInternetImg: UIImage?, noInternetLabelTitle: NSAttributedString?, customView: UIView?) {
        objNetworkUnavailableView?.noInternetTitleText = noInternetLabelTitle ?? "NO INTERNET".makeAttributedString(font: UIFont.systemFont(ofSize: 25), textColor: .lightGray)
        objNetworkUnavailableView?.noInternetImg = noInternetImg ?? UIImage(named: "noInternet")
        objNetworkUnavailableView?.btnTryAgain.addTarget(self, action: #selector(retryButtonTapped(sender:)), for: .touchUpInside)
        self.backgroundView = objNetworkUnavailableView
        self.separatorColor = UIColor.clear
        self.dataSource = nil
        self.delegate = nil
    }

    @objc func retryButtonTapped(sender: UIButton) {
//        networkDelegate?.retryNetworkCall()
        guard let compl = self.networkUnReachableBlock else {
            return
        }
        compl()
    }
}
