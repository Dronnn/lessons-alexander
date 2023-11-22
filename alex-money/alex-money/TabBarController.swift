//
//  TabBarController.swift
//  alex-money
//
//  Created by andrew mayer on 07.11.23.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
        setupAppearance()
    }

    // MARK: - setups

    private func setupAppearance() {
        tabBar.tintColor = .gray
        tabBar.barTintColor = .gray
    }

    private func setupViewControllers() {

        let vc1 = MainViewController()
        let nc1 = UINavigationController(rootViewController: vc1)
        nc1.navigationBar.prefersLargeTitles = true
        vc1.view.backgroundColor = .systemBackground

        let vc2 = HistoryViewController()
        let nc2 = UINavigationController(rootViewController: vc2)
        nc2.navigationBar.prefersLargeTitles = true
        vc2.view.backgroundColor = .systemBackground

        let vc3 = SettingsViewController()
        let nc3 = UINavigationController(rootViewController: vc3)
        nc3.navigationBar.prefersLargeTitles = true
        vc3.view.backgroundColor = .systemBackground

        setViewControllers(
            [nc1, nc2, nc3],
            animated: false
        )
    }


}
