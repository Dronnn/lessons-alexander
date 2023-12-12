//
//  TabBarControllerViewController.swift
//  expensesSachko
//
//  Created by Sap on 07.11.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        setupApperance()

    }
    
    private func setupApperance(){
        tabBar.tintColor = .gray
        tabBar.barTintColor = .gray
    }
    
    private func setupViewControllers() {
        
        let vc = MainViewController()
        let nc1 = UINavigationController(rootViewController: vc)
        nc1.navigationBar.prefersLargeTitles = true
        vc.view.backgroundColor = .systemBackground
        
        let historyPresenter = HistoryPresenter()
        let vc2 = HistoryViewController(presenter: historyPresenter)
        historyPresenter.viewController = vc2

        let nc2 = UINavigationController(rootViewController: vc2)
        nc2.navigationBar.prefersLargeTitles = true
        vc2.view.backgroundColor = .systemBackground

        let vc3 = SettingsViewController()
        let nc3 = UINavigationController(rootViewController: vc3)
        nc3.navigationBar.prefersLargeTitles = true
        vc3.view.backgroundColor = .systemBackground
        
        tabBar.standardAppearance = UITabBarAppearance()

        setViewControllers(
            [nc1, nc2, nc3],
            animated: false)
    }
    
}
