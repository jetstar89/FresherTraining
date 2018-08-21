//
//  PostViewController.swift
//  Login
//
//  Created by admin on 8/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var postTableView: UITableView!
    var dataPost = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func initView() {
        postTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil),
                               forCellReuseIdentifier: "PostTableViewCell")
    }
    func getData() {
        let service = PostService()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        service.getPersonResult { (result) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch result {
            case .failure(let error as NSError):
                print(error)
            case .success(let post):
                self.dataPost = post
                self.postTableView.reloadData()
            }
        }
    }
}
extension PostViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPost.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell",
                                                                          for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        cell.titleLabel.text = dataPost[indexPath.row].title
        cell.bodyLabel.text = dataPost[indexPath.row].body
        return cell
    }
}
