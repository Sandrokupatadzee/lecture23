//
//  MainScreen.swift
//  lecture23
//
//  Created by MacBook Pro on 03.05.24.
//

import UIKit
import Network

class MainScreen: UIViewController {

    public var catFacts: [Fact] = []
    private let urlString: String = "https://catfact.ninja/facts?max_length=300&limit=100"
    public let spaceBetweenSections: CGFloat = 2.0
    private let networkService = NetworkService()
    
    private let tableView: UITableView = {
        let screenTableView = UITableView()
        screenTableView.register(CatFactCell.self, forCellReuseIdentifier: CatFactCell.identifier)
        screenTableView.backgroundColor = .clear
        return screenTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CatFacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        setupUI()
        fetchData()
        tableView.delegate = self
        tableView.dataSource = self
                
    }

//    MARK: - functions
    
    func setupUI() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12)
        ])
    }
    
    private func fetchData() {
        networkService.getData(urlString: urlString) { [weak self] (result: Result<CatFact, Error>) in
            switch result {
            case .success(let facts):
                self?.catFacts = facts.data
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
