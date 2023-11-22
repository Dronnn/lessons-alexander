//
//  HistoryViewController.swift
//  alex-money
//
//  Created by andrew mayer on 07.11.23.
//

import UIKit

final class HistoryViewController: UIViewController {

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "History"

        setupTabbarItem()
    }

    // MARK: - setups

    private func setupTabbarItem() {
        tabBarItem = UITabBarItem(
            title: "history",
            image: UIImage(
                systemName: "list.bullet.circle"
            ),
            selectedImage: UIImage(
                systemName: "list.bullet.circle.fill"
            )
        )
    }

}
