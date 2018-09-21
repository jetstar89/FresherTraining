//
//  PostViewController.swift
//  TimeKeeping
//
//  Created by Đinh Ngọc Vũ on 8/21/18.
//  Copyright © 2018 GEM. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var posts = [Post]()
    let postServices = PostServices()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        setUpNavigationBar(title: "Post",
                           leftBarButton: UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_three_line"),
                                                          style: .done,
                                                          target: self,
                                                          action: #selector(onShowLeftMenu(_:))),
                           rightBarButton: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - FUNC
    func reloadData() {
        if posts.isEmpty {
            tableView.setEmpty(message: "No Data")
        } else {
            tableView.backgroundView = nil
        }
        self.tableView.reloadData()
        self.tableView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    func getPost(_ term: String) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        postServices.getPosts(term) { (result) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch result {
            case .success(let posts):
                self.posts = posts
                self.reloadData()
            case .failure(let error):
                self.alertWith("Error", error.localizedDescription)
            }
            return self.tableView.reloadData()
        }
    }
}

extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(posts.count.description)
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        let post = posts[indexPath.row]
        cell.userIdLabel.text = "User ID: " + post.userId.description
        cell.idLabel.text = "Post ID: " + post.id.description
        cell.titleLabel.text = "Title: " + post.title
        cell.bodyLabel.text = post.body

        return cell
    }
}

extension PostViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let term = searchBar.text ?? ""
        if term.isEmpty {
            //
        } else {
            getPost(term)
        }
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        //searchBar.becomeFirstResponder()
        return true
    }
}
