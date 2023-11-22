//
//  SettingsViewController.swift
//  alex-money
//
//  Created by andrew mayer on 07.11.23.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"

        setupTabbarItem()
    }

    // MARK: - setups

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

