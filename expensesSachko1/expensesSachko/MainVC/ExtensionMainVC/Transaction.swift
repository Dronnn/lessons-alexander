//
//  Transaction.swift
//  expensesSachko
//
//  Created by andrew mayer on 17.11.23.
//

import Foundation
import UIKit

struct Transaction {
    let title: String
    let category: Category 
    let date: Date
    let amount: Float
    lazy var image: UIImage = category.image

    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: date)
    }

    var amountString: String {
        "$\(amount)"
    }
}

enum Category: String {
    case auto = "Auto"
    case bills = "Bills"
    case entertainment = "Entertainment"
    case fees = "Fees"
    case food = "Food"
    case home = "Home"
    case income = "Income"
    case shopping = "Shopping"
    case transfer = "Transfer"
    
    var image: UIImage {
        switch self {
        case .auto:
            return UIImage(systemName: "car.fill") ?? UIImage()
        case .bills:
            return UIImage(systemName: "dollarsign.square.fill") ?? UIImage()
        case .entertainment:
            return UIImage(systemName: "movieclapper.fill") ?? UIImage()
        case .fees:
            return UIImage(systemName: "dollarsign.arrow.circlepath") ?? UIImage()
        case .food:
            return UIImage(systemName: "takeoutbag.and.cup.and.straw.fill") ?? UIImage()
        case .home:
            return UIImage(systemName: "house.fill") ?? UIImage()
        case .income:
            return UIImage(systemName: "dollarsign.circle.fill") ?? UIImage()
        case .shopping:
            return UIImage(systemName: "hanger") ?? UIImage()
        case .transfer:
            return UIImage(systemName: "bus") ?? UIImage()
        }
    }
}
