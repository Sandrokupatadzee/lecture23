//
//  CatFactCell.swift
//  lecture23
//
//  Created by MacBook Pro on 03.05.24.
//

import UIKit

class CatFactCell: UITableViewCell {
    
    static let identifier = "CatFactCell"
    private var catFact: CatFact?
    
    private let catFactLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 5
        return label
    }()
//    MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    MARK: - Functions

    private func setupUI() {
        addSubview(catFactLabel)
        
        catFactLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            catFactLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            catFactLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            catFactLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
    
    func updateCell(with item: CatFactTableViewCellViewModel) {
        catFactLabel.text = item.catFactText
    }
}

