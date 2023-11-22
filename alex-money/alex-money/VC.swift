//
//  VC.swift
//  alex-money
//
//  Created by andrew mayer on 11.11.23.
//

import UIKit

class VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "title"

        view.backgroundColor = .red

        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [weak self] _ in
            self?.goBack()
        }
    }

    func goBack() {
        navigationController?.popViewController(animated: true)
    }

}
