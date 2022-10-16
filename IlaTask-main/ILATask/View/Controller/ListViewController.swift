//
//  ListViewController.swift
//  ILATask
//
//  Created by Ravikumar, Gowtham on 13/10/22.
//

import UIKit

class ListViewController: UIViewController {

    fileprivate lazy var listTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        tableView.allowsSelection = false
        tableView.register(TableViewHeaderCell.self, forHeaderFooterViewReuseIdentifier: TableViewHeaderCell.identifier)
        return tableView
    }()

    var tableViewDelegate: ListTableViewDelegateInterface?
    private var presenter: ListPresenterInterface?
    private var selectedIndex: Int = 0

    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
        configureViews()
        configureNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getList()
    }

    private func configureViews() {
        listTableView.tableFooterView = UIView()
        listTableView.delegate = tableViewDelegate
        listTableView.dataSource = tableViewDelegate
        view.addSubview(listTableView)

        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: view.topAnchor),
            listTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            listTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func configureNavigationBar() {
        navigationItem.title = "Ila Test"
    }

    private func setupDataSource() {
        let repository = ListRepository()
        presenter = ListPresenter(repository: repository)
        presenter?.delegate = self
        presenter?.searchDelegate = self
        tableViewDelegate = ListTableViewDelegate(delegate: self)
    }
}

extension ListViewController: ListPresenterRequestInterface {

    func succeeded() {
        guard let presenter = presenter else {
            return
        }
        tableViewDelegate?.list = presenter.listModel
        tableViewDelegate?.subList = presenter.listModel[selectedIndex].subListModel
        listTableView.reloadData()
    }
}

extension ListViewController: ListDelegate {
    func searchText(text: String) {
        presenter?.getSearchResult(selectedIndex:selectedIndex, textSearched: text)
    }
    
    func selectedIndex(index: Int) {
        guard let presenter = presenter else {
            return
        }
        selectedIndex = index
        tableViewDelegate?.subList = presenter.listModel[index].subListModel
        listTableView.reloadData()
    }
    
    func reload() {
        presenter?.getList()
    }
}

extension ListViewController: ListPresenterSearchInterface {
    func searchResult() {
        guard let presenter = presenter else {
            return
        }
        tableViewDelegate?.subList = presenter.filteredList
        listTableView.reloadData()
    }
}
