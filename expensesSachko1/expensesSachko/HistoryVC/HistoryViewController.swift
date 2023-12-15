//
//  HistoryViewController.swift
//  expensesSachko
//
//  Created by Sap on 07.11.2023.
//

import UIKit

class HistoryViewController: UIViewController {

    // MARK: - properties

    var presenter: HistoryPresenter

    // MARK: - consts

    private enum Const { // namespace
        static let heightCellTransactions: CGFloat = 80.0
    }
    
    // MARK: - subviews
    
    private lazy var tableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    //MARK: - life cycle

    init(presenter: HistoryPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "History"
        
        setupTabbarItem()
        setupTableView()
    }
    
    // MARK: - Set Up
        
    private func setupTableView() {
                
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(RecordCell.self, forCellReuseIdentifier: RecordCell.cellId)
        
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupTabbarItem() {
        tabBarItem = UITabBarItem(
            title: "history",
            image: UIImage(
                systemName: "list.bullet.circle"
            ),
            selectedImage: UIImage(systemName: "list.bullet.circle.fill")
        )
    }
}

// MARK: - 

extension HistoryViewController {
    func showDetailsViewController(with viewModel: DetailsViewModel) {
        let detailsVC = DetailsViewController(with: viewModel)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension HistoryViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return Const.heightCellTransactions
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        presenter.pressedCell(with: indexPath)
    }
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        presenter.transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: RecordCell.cellId,
                for: indexPath
            ) as? RecordCell
        else { fatalError() }
        cell.setup(
            with: RecordCell.ViewModel(
                title: presenter.transactions[indexPath.row].title,
                category: presenter.transactions[indexPath.row].category.rawValue,
                date: presenter.transactions[indexPath.row].dateString,
                amount: presenter.transactions[indexPath.row].amountString,
                image: presenter.transactions[indexPath.row].category.image
            )
        )
        return cell
    }
}

