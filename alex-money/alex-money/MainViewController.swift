//
//  MainViewController.swift
//  alex-money
//
//  Created by andrew mayer on 07.11.23.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - subviews

    private lazy var tableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Dashboard"

        tableView.delegate = nil
        setupTabbarItem()
        setupTableView()

//        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [weak self] _ in
//            self?.moveForward()
//        }

    }

    func moveForward() {
        let vc = VC()
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - setups

    private func setupTableView() {

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(
            BalanceCell.self,
            forCellReuseIdentifier: BalanceCell.cellId
        )

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
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

}

extension MainViewController: UITableViewDelegate {

}

extension MainViewController: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        10
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: BalanceCell.cellId,
                for: indexPath
            ) as! BalanceCell

            cell.setup(color: .red)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: BalanceCell.cellId,
                for: indexPath
            ) as! BalanceCell

            cell.setup(color: .blue)
            return cell
        }
    }

}
