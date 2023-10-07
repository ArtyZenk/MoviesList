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
    
    private let networkManager = NetworkManager()
    private let imageManager = ImageManager()
    
    private var character: [Result]? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.moviesTable.reloadData()
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarch()
        setupLayout()
        setupNavigationBar()
        
        networkManager.fetchData { character in
            self.character = character.results ?? []
        }
    }
}

// MARK: - Configuration View

extension MoviesListView {
    private func setupHierarch() {
        view.addSubview(moviesTable)
    }
    
    private func setupLayout() {
        moviesTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Movies"
    }
}

// MARK: - UITableViewDelegate

extension MoviesListView: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension MoviesListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        character?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movies", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let currentCharacter = character?[indexPath.row]
        
        content.text = "\(currentCharacter?.name ?? "error")"
        content.textProperties.font = UIFont.systemFont(ofSize: 15, weight: .bold)
                
        DispatchQueue.global().async { [weak self] in
            self?.imageManager.fetchImage(from: (currentCharacter?.image)!) { data in
                DispatchQueue.main.async {
                    content.image = UIImage(data: data)
                    cell.contentConfiguration = content
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
