//
//  SettingsViewController.swift
//  expensesSachko
//
//  Created by Sap on 07.11.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    private let settingsManager = SettingsManager.shared

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(
            SettingsCell.self,
            forCellReuseIdentifier: SettingsCell.cellId
        )
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        setupTabbarItem()
        setupTableView()
        setupNavigation()
    }
    
    //MARK: Set Up TableView
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }
    
    // MARK: Set Up Navigation
    private func setupNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(
                systemName: "person.crop.circle"
            ),
            style: .plain,
            target: self,
            action: #selector(
                logInAction
            )
        )
    }
    
    //MARK: add actions
    @objc private func logInAction(){
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
        
    //MARK: Set Up TabbarItem
    private func setupTabbarItem() {
        tabBarItem = UITabBarItem(
            title: "settings",
            image: UIImage(
                systemName: "gear.circle"
            ),
            selectedImage: UIImage(
                systemName: "gear.circle.fill"
            )
        )
    }
}

extension SettingsViewController: UITableViewDelegate {
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingsCell.cellId,
            for: indexPath
        ) as? SettingsCell
        else { fatalError() }

        settingsManager.useFaceID = true

//        cell.setup(
//            with: SettingsCell.ViewModelSettings(title: <#String#>, image: <#UIImage#>, buttonType: <#typeOfButtonSettingsTableView#>
//                summ: "\(balance.income + balance.expense)",
//                income: "\(balance.income)",
//                expense: "\(balance.expense)"
//            )
//        )
        return cell
    }
}
