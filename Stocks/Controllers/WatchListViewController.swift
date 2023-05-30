//
//  WatchListViewController.swift
//  Stocks
//
//  Created by Tai Chin Huang on 2023/4/10.
//

import UIKit

class WatchListViewController: UIViewController {
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupSearchController()
        setupTitleView()
    }
    
    // MARK: - Private
    private func setupTitleView() {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 0, width: titleView.width - 20, height: titleView.height))
        titleLabel.text = "Stocks"
        titleLabel.font = .systemFont(ofSize: 32, weight: .bold)
        titleView.addSubview(titleLabel)
        navigationItem.titleView = titleView
    }
    
    
    private func setupSearchController() {
        let resultVC = SearchResultsViewController()
        resultVC.delegate = self
        let searchVC = UISearchController(searchResultsController: resultVC)
        searchVC.searchResultsUpdater = self // Like UITableView Delegate，代理searchController去執行使用者輸入的內容
        navigationItem.searchController = searchVC
    }
}

extension WatchListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) { // 擷取使用者輸入的內容
        guard let query = searchController.searchBar.text, // 取得searchBar text，並且清楚前面的空白內容後如果不是空的才繼續
              let resultsVC = searchController.searchResultsController as? SearchResultsViewController,
              !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        // Optimize to reduce number of searches for when user stops typing
        // Call API to search
        // Update results controller
        resultsVC.update(with: ["GOOGLE"])
    }
}

extension WatchListViewController: SearchResultsViewControllerDelegate {
    func searchResultsViewControllerDidSelect(searchResult: String) {
        // Present stock details for given selection
    }
}
