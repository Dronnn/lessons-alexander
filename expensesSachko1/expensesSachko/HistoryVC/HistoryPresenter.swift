//
//  HistoryPresenter.swift
//  expensesSachko
//
//  Created by andrew mayer on 24.11.23.
//

import Foundation

class HistoryPresenter {

    weak var viewController: HistoryViewController?

    // MARK: - properties

    // take from the model layer
    var transactions: [Transaction] = [
        Transaction(title: "111", category: .auto, date: Date(), amount: 100),
        Transaction(title: "222", category: .bills, date: Date(), amount: 200),
        Transaction(title: "333", category: .entertainment, date: Date(), amount: 300),
        Transaction(title: "444", category: .home, date: Date(), amount: -300),
    ]

    // MARK: - actions

    func pressedCell(with indexPath: IndexPath) {
        // получить даные
        let data = transactions[indexPath.row]
        // сформировать вью модель
//        let viewModel = ...
        // передать команду на открытие detailsVC с вьюмоделью
        viewController.showDetailViewController(with: viewModel)
    }


}
