//
//  SettingsCell.swift
//  expensesSachko
//
//  Created by Sap on 15.12.2023.
//

import UIKit

enum typeOfButtonSettingsTableView {
    case slide
    case arrow
}

final class SettingsCell: UITableViewCell {
    
    static let cellId = "settings cell"
    
    struct ViewModelSettings {
        let title: String
        let image: UIImage
        var buttonType: typeOfButtonSettingsTableView {
            willSet {
                //
            }
        }

    }
    
    private let title = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let image : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    //MARK: - life cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        image.image = nil
    }

    //MARK: - setup

    private func setupLayout() {
        addSubview(title)
        addSubview(image)
        addSubview(button)
        
        backgroundColor = .systemGray6
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            title.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            
            button.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
    }

    func setup(with model: ViewModelSettings) {
        title.text = model.title
        image.image = model.image
//        button.setImage({}, for: <#T##UIControl.State#>)
        switch model.buttonType {
        case .slide :
            button.setImage(UIImage(systemName: "switch.2"), for: .normal)
        case .arrow :
            button.setImage(UIImage(systemName: "arrow.right.circle"), for: .normal)
        }
    }

}
