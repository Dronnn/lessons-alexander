//
//  SettingsViewController.swift
//  expensesSachko
//
//  Created by Sap on 07.11.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let profile: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        
        setupTabbarItem()
        setupTableView()
        addActions()
    }
    
    //MARK: Set Up TableView
    
    private func setupTableView() {
        view.addSubview(profile)
        NSLayoutConstraint.activate([
            profile.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            profile.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            profile.widthAnchor.constraint(equalToConstant: 30),
            profile.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    //MARK: add actions
    private func addActions(){
        profile.addAction(UIAction(handler: { [weak self] _ in
            let vc = ProfileViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }), for: .touchUpInside)
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
