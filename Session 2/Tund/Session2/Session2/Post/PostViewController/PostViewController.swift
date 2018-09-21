//
//  PostViewController.swift
//  Session2
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SideMenu

class PostViewController: UIViewController {
    var postArr = [Posts]()
     let services = AllDataServices()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var postTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        setupViews()
        getData()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "iconMenu"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(onShowLeftMenu(_:)))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: function and init
    @objc func onShowLeftMenu(_ sender: MainNavigationController) {
        guard let sideMenu = SideMenuManager.default.menuLeftNavigationController else { return }
        present(sideMenu, animated: true, completion: nil)
    }
    func getData() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        services.getDataResults("2") { (result) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch result {
            case .success(let posts):
                self.postArr = posts
                self.reloadData()
            case .failure(let error):
                print("Fail get data")
                print(error)
            }
        }
    }
    func setupViews() {
        navigationItem.title = "Test API"
        postTableView.tableFooterView = UIView(frame: .zero)
        reloadData()
    }
    
    func reloadData() {
        if postArr.isEmpty {
            postTableView.setEmpty(message: "No Data")
        } else {
            postTableView.backgroundView = nil
        }
        self.postTableView.reloadData()
        self.postTableView.setContentOffset(CGPoint.zero, animated: false)
    }
}
extension PostViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idenfier = "cell"
        
        guard let cell: PostTableViewCell = postTableView.dequeueReusableCell(
            withIdentifier: idenfier,
            for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
        }
        cell.userIDLabel.text = postArr[indexPath.row].userId
        cell.idLabel.text = postArr[indexPath.row].id
        return cell
    }
}
extension PostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
