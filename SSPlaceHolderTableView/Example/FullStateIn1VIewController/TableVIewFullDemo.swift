//
//  TableVIewFullDemo.swift
//  SSPlaceHolderTableView
//
//  Created by Vishal Patel on 11/01/19.
//  Copyright © 2019 Vishal Patel. All rights reserved.
//

import UIKit

class TableVIewFullDemo: UIViewController {

    @IBOutlet weak var tblView: TableView!
    var reachability: Reachability!
    var isForNoData: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.networkUnReachableBlock = {
            // put your network Call here.
            self.callAPI(isForNoData: self.isForNoData)
        }
//        tblView.centerOffSetMultiplier = 0.35      // Change multiplier if you want ot change vertical position of placeHolder Image.
    }
    
    @IBAction func btnActionNoDataAPi(_ sender: Any) {
        isForNoData = true
        callAPI(isForNoData: isForNoData)
    }
    
    @IBAction func btnActionDataApi(_ sender: Any) {
        isForNoData = false
        callAPI(isForNoData: isForNoData)
    }
    
}

extension TableVIewFullDemo {
    func callAPI(isForNoData: Bool) {
        reachability = Reachability()!
        if reachability.connection != .none {
            self.tblView.setState(.loading(loadingImg: nil, loadingLabelTitle: nil))
            let urlString : String = "https://jsonplaceholder.typicode.com/comments?postId=\(isForNoData ? 0 : 1)"
            let url = URL(string: urlString)
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
                do {
                    let arrJson = try JSONSerialization.jsonObject(with: data!) as! [[String: Any]]
                    print(arrJson)
                    DispatchQueue.main.async {
                        if arrJson.count > 0 {
                            self.tblView.setState(.dataAvailable(viewController: self))
                        } else {
                            self.tblView.setState(.noDataAvailable(noDataImg: nil, noDataLabelTitle: nil))
                        }
                    }
                } catch {
                    print("error")
                }
            })
            task.resume()
        } else {
            self.tblView.setState(.checkInternetAvaibility(noInternetImg: nil, noInternetLabelTitle: nil))
        }
        
    }
    
}
extension TableVIewFullDemo : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
