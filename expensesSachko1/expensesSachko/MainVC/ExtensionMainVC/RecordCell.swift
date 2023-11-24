//
//  RecordCell.swift
//  expensesSachko
//
//  Created by Sap on 14.11.2023.
//

import UIKit

final class RecordCell: UITableViewCell {
    
    static let cellId = "record cell"

    struct ViewModel {
        let title: String
        let category: String
        let date: String
        let amount: String
        let image: UIImage
    }

    //MARK: - sebviews
    
    private let imageShop = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let titleBalanceLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let summBalanceLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let catagoryLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let dateLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    
    //MARK: - life cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleBalanceLabel.text = nil
        summBalanceLabel.text = nil
        catagoryLabel.text = nil
        imageShop.image = nil
        dateLabel.text = nil
    }

    //MARK: - setup

    private func setupLayout() {
        addSubview(titleBalanceLabel)
        addSubview(summBalanceLabel)
        addSubview(catagoryLabel)
        addSubview(imageShop)
        addSubview(dateLabel)
        
        backgroundColor = .systemGray6
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            
            imageShop.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageShop.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            titleBalanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleBalanceLabel.leadingAnchor.constraint(equalTo: imageShop.leadingAnchor, constant: 40),
                        
            catagoryLabel.topAnchor.constraint(equalTo: titleBalanceLabel.bottomAnchor, constant: -1),
            catagoryLabel.leadingAnchor.constraint(equalTo: titleBalanceLabel.leadingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: catagoryLabel.bottomAnchor, constant: -1),
            dateLabel.leadingAnchor.constraint(equalTo: titleBalanceLabel.leadingAnchor),
            
            summBalanceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            summBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),

        ])
    }

    func setup(with model: ViewModel) {
        titleBalanceLabel.text = model.title
        summBalanceLabel.text = "\(model.amount)"
        catagoryLabel.text = model.category
        imageShop.image = model.image
        dateLabel.text = model.date
    }
}
