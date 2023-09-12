//
//  FinanceTableViewCell.swift
//  UIScreen_2
//
//  Created by Nazerke Sembay on 12.09.2023.
//

import UIKit

class FinanceTableViewCell: UITableViewCell {

    public static let identifier = "FinanceTableViewCell"
    
    let stackPrice: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 2
        return stack
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(
            name: "Inter-Medium",
            size: 16
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(
            red: 0,
            green: 0,
            blue: 0,
            alpha: 0.5
        )
        
        label.font = UIFont(
            name: "Inter-Light",
            size: 14
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    var expensesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(
            name: "Inter-Bold",
            size: 14
        )
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var posterBGImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var posterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(finance: Finance) {
        posterImage.image = UIImage(named: finance.posterImage)
        posterBGImage.image = UIImage(named: finance.posterBGImage)
        titleLabel.text = finance.titleLabel
        descriptionLabel.text = finance.descriptionLabel
        expensesLabel.text = finance.expensesLabel
    }
}

extension FinanceTableViewCell {
    func configureView() {
        configImage()
        stackTitleConfigure()
        stackPriceConfigure()
    }
    
    func configImage(){
        addSubview(posterBGImage)
        addSubview(posterImage)
        
        NSLayoutConstraint.activate([
            posterBGImage.heightAnchor.constraint(equalToConstant: 30),
            posterBGImage.widthAnchor.constraint(equalToConstant: 30),
            posterBGImage.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            posterBGImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            posterImage.heightAnchor.constraint(equalToConstant: 15),
            posterImage.widthAnchor.constraint(equalToConstant: 15),
            posterImage.centerYAnchor.constraint(equalTo: posterBGImage.centerYAnchor),
            posterImage.centerXAnchor.constraint(equalTo: posterBGImage.centerXAnchor)
        ])
    }
    
    func stackTitleConfigure() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: posterBGImage.trailingAnchor,
                constant: 16
            ),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func stackPriceConfigure() {
        addSubview(stackPrice)
        stackPrice.addArrangedSubview(expensesLabel)
        stackPrice.addArrangedSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            stackPrice.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
            stackPrice.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
