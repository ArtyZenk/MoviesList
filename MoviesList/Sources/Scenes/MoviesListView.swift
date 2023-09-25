//
//  ViewController.swift
//  MoviesList
//
//  Created by Artyom Guzenko on 25.09.2023.
//

import UIKit
import SnapKit

class MoviesListView: UIViewController {
    
    // MARK: - Outlets
    private lazy var searchController: UISearchController = {
        let search = UISearchController()
        return search
    }()
    
    private lazy var moviesTable: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "movies")
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarch()
        setupLayout()
        setupNavigationBar()
    }
}

// MARK: - Configuration View

extension MoviesListView {
    private func setupHierarch() {
        view.addSubview(moviesTable)
    }
    
    private func setupLayout() {
        moviesTable.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(view)
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        title = "Movies"
    }
}

// MARK: - UITableViewDelegate

extension MoviesListView: UITableViewDelegate {

}

// MARK: - UITableViewDataSource

extension MoviesListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movies", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "cell \(indexPath.row)"
        content.image = UIImage(named: "1")
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}