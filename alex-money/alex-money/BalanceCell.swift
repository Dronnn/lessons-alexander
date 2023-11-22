//
//  BalanceCell.swift
//  alex-money
//
//  Created by andrew mayer on 14.11.23.
//

import UIKit

final class BalanceCell: UITableViewCell {

    static let cellId = "balance cell"

    // MARK: - subviews

    let titleBalanceLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let summBalanceLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }

    // MARK: - life cycle

    override func prepareForReuse() {
        super.prepareForReuse()
        titleBalanceLabel.text = nil
        summBalanceLabel.text = nil
    }

    // MARK: - setups

    private func setupLayout() {
        addSubview(titleBalanceLabel)
        addSubview(summBalanceLabel)
        NSLayoutConstraint.activate([
            //
        ])
    }

    func setup(color: UIColor) {
        backgroundColor = color
    }

}
