//
//  DetailsViewController.swift
//  expensesSachko
//
//  Created by andrew mayer on 08.12.23.
//

import UIKit

class DetailsViewController: UIViewController {

    let viewModel: DetailsViewModel

    // MARK: - life cycle

    init(with viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Details"

        setupNavigationItem()

        view.backgroundColor = .systemBackground

        // Do any additional setup after loading the view.
    }

    // MARK: - setups

    private func setupNavigationItem() {
        navigationItem.largeTitleDisplayMode = .never
        setupRemoveButton()
    }

    private func setupRemoveButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "trash"),
            style: .plain,
            target: self,
            action: #selector(removeRecord)
        )
    }

    // MARK: - actions

    @objc
    private func removeRecord() {
        let alert = UIAlertController(title: "Removing", message: "Are you sure?", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(
                title: "Remove",
                style: .destructive
            ) { [weak self] _ in
                print("removed")
                self?.navigationController?.popViewController(animated: true)
            }
        )

        alert.addAction(
            UIAlertAction(
                title: "Cancel",
                style: .cancel
            ) { _ in
                print("Canceled")
            }
        )
        present(alert, animated: true)
    }

}
