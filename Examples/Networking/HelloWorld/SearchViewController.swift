//
//  ViewController.swift
//  HelloWorld
//
//  Created by hnc on 7/17/18.
//  Copyright © 2018 hnc. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let service = QueryService()
    var searchResults = [Track]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews() {
        navigationItem.title = "Search"
        tableView.tableFooterView = UIView(frame: .zero)
        reloadData()
    }
    
    func reloadData() {
        if searchResults.isEmpty {
            tableView.setEmpty(message: "No Data")
        } else {
            tableView.backgroundView = nil
        }
        self.tableView.reloadData()
        self.tableView.setContentOffset(CGPoint.zero, animated: false)
    }
    
    func getData(_ term: String) {
        let services = TrackServices()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        services.getSearchResults(term) { (result) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch result {
            case .success(let tracks):
                self.searchResults = tracks
                self.reloadData()
            case .failure(let error):
                self.alertWith("Error", error.localizedDescription)
            }
        }
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        }
        let track = searchResults[indexPath.row]
        cell?.textLabel?.text = track.name
        cell?.detailTextLabel?.text = track.artist
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let term = searchBar.text ?? ""
        if term.isEmpty {
            return
        } else {
            getData(term)
//            UIApplication.shared.isNetworkActivityIndicatorVisible = true
//            service.getSearchResults(searchTerm: term, completion: { (tracks, errorMessage) in
//                UIApplication.shared.isNetworkActivityIndicatorVisible = false
//                if let tracks = tracks {
//                    self.searchResults = tracks
//                    self.reloadData()
//                } else {
//                    self.alertWith("Error", errorMessage)
//                }
//            })
        }
    }
}
