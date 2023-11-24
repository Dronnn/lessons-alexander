//
//  BalanceCell.swift
//  expensesSachko
//
//  Created by Sap on 14.11.2023.
//

import UIKit

final class BalanceCell: UITableViewCell {
    
    static let cellId = "blalnce cell"

    struct ViewModel {
        let summ: String
        let income: String
        let expense: String
    }

    //MARK: - sebviews
    
    private let titleBalanceLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Balance"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let summBalanceLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    private let separatorView1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let separatorView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let upView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "arrowshape.up.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let downView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "arrowshape.down")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleIncomeLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Income"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    //MARK: - Income SUMM
    private let summIncomeLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    private let titleExpenseLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Expense"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    //MARK: - Expense SUMM
    private let summExpenseLabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
    }

    //MARK: - setup

    private func setupLayout() {
        addSubview(titleBalanceLabel)
        addSubview(summBalanceLabel)
        addSubview(separatorView1)
        addSubview(separatorView2)
        addSubview(upView)
        addSubview(downView)
        addSubview(titleIncomeLabel)
        addSubview(titleExpenseLabel)
        addSubview(summIncomeLabel)
        addSubview(summExpenseLabel)
        
        backgroundColor = .systemGray6
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            titleBalanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleBalanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            summBalanceLabel.topAnchor.constraint(equalTo: titleBalanceLabel.bottomAnchor, constant: 5),
            summBalanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            separatorView1.topAnchor.constraint(equalTo: summBalanceLabel.bottomAnchor, constant: 20),
            separatorView1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            separatorView1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            separatorView1.heightAnchor.constraint(equalToConstant: 0.5),
            
            separatorView2.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 20),
            separatorView2.centerXAnchor.constraint(equalTo: centerXAnchor),
            separatorView2.widthAnchor.constraint(equalToConstant: 0.5),
            separatorView2.heightAnchor.constraint(equalToConstant: 40),
            
            upView.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 30),
            upView.leadingAnchor.constraint(equalTo: separatorView2.trailingAnchor, constant: 30),
            
            titleExpenseLabel.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 20),
            titleExpenseLabel.leadingAnchor.constraint(equalTo: upView.trailingAnchor, constant: 20),
            
            summExpenseLabel.topAnchor.constraint(equalTo: titleExpenseLabel.bottomAnchor, constant: 5),
            summExpenseLabel.leadingAnchor.constraint(equalTo: upView.trailingAnchor, constant: 20),
            
            downView.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 30),
            downView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            titleIncomeLabel.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 20),
            titleIncomeLabel.leadingAnchor.constraint(equalTo: downView.trailingAnchor, constant: 20),
            
            summIncomeLabel.topAnchor.constraint(equalTo: titleIncomeLabel.bottomAnchor, constant: 5),
            summIncomeLabel.leadingAnchor.constraint(equalTo: downView.trailingAnchor, constant: 20),

        ])
    }

    func setup(with model: ViewModel) {
        summBalanceLabel.text = model.summ
        summIncomeLabel.text = model.income
        summExpenseLabel.text = model.expense
    }
}
