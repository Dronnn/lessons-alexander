//
//  ViewController.swift
//  expensesSachko
//
//  Created by Sap on 07.11.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - types

    private enum Section: Int, CaseIterable {
        case balance
        case transactions
    }

    // MARK: - consts

    private enum Const { // namespace
        static let heightCellBalance: CGFloat = 180
        static let heightCellTransactions: CGFloat = 80
        static let balanceSectionCellsCount: Int = 1
    }

    // MARK: - subviews
    
    private lazy var tableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - properties

    var transactions: [Transaction] = [
        Transaction(title: "111", category: .auto, date: Date(), amount: 100),
        Transaction(title: "222", category: .bills, date: Date(), amount: 200),
        Transaction(title: "333", category: .entertainment, date: Date(), amount: 300),
        Transaction(title: "444", category: .home, date: Date(), amount: -300),
    ]
    var balance = Balance(income: 0, expense: 0)

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
                
        title = "Dashboard"

        setupTabbarItem()
        setupTableView()
    }
    
    // MARK: - Set Up
        
    private func setupTableView() {
        
        balance = Balance(income: amountIncomeAndAmountExpense(in: transactions).0, expense: amountIncomeAndAmountExpense(in: transactions).1)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(BalanceCell.self, forCellReuseIdentifier: BalanceCell.cellId)
        tableView.register(RecordCell.self, forCellReuseIdentifier: RecordCell.cellId)
        
        tableView.separatorStyle = .none
//        tableView.separatorStyle = .singleLine
//        tableView.separatorColor = UIColor.lightGray
//        tableView.separatorInset = UIEdgeInsets(top: 50, left: 0, bottom: 50, right: 0)
        
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
            title: "main",
            image: UIImage(
                systemName: "creditcard.circle"
            ),
            selectedImage: UIImage(
                systemName: "creditcard.circle.fill"
            )
        )
    }
    
    func amountIncomeAndAmountExpense(in listSumm: [Transaction]) -> (Float, Float) {
        var amountIncome: Float = 0
        var amountExpense: Float = 0
        for i in listSumm {
            if i.amount > 0 {
                amountIncome += i.amount
            } else {
                amountExpense += i.amount
            }
        }
        return (amountIncome, amountExpense)
    }
}

extension MainViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard
            let section = Section(rawValue: indexPath.section)
        else { fatalError() }

        switch section {
        case .balance:
            return Const.heightCellBalance
        case .transactions:
            return Const.heightCellTransactions
        }
    }
}

extension MainViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard
            let section = Section(rawValue: section)
        else { fatalError() }

        switch section {
        case .balance:
            return Const.balanceSectionCellsCount
        case .transactions:
            return transactions.count
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard
            let section = Section(rawValue: section)
        else { return nil }

        switch section {
        case .transactions:
            return "Recent transactions"
        default: return nil
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let section = Section(rawValue: indexPath.section)
        else { fatalError() }

        switch section {
        case .balance:
            return balanceCell(for: indexPath)
        case .transactions:
            return transactionCell(for: indexPath)
        }
    }
}

    // MARK: - cells

extension MainViewController {

    private func balanceCell(for indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: BalanceCell.cellId,
                for: indexPath
            ) as? BalanceCell
        else { fatalError() }

        cell.setup(
            with: BalanceCell.ViewModel(
                summ: "\(balance.income + balance.expense)",
                income: "\(balance.income)",
                expense: "\(balance.expense)"
            )
        )
        
        return cell
    }

    private func transactionCell(for indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: RecordCell.cellId,
                for: indexPath
            ) as? RecordCell
        else { fatalError() }
//        let padding = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
//        cell.layoutMargins = padding
        cell.setup(
            with: RecordCell.ViewModel(
                title: transactions[indexPath.row].title,
                category: transactions[indexPath.row].category.rawValue,
                date: transactions[indexPath.row].dateString,
                amount: transactions[indexPath.row].amountString,
                image: transactions[indexPath.row].category.image
            )
        )
        return cell
    }
}

