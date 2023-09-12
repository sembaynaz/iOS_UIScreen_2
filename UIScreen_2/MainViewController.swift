//
//  ViewController.swift
//  UIScreen_2
//
//  Created by Nazerke Sembay on 11.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var arrayFinance: [Finance] = []
    
    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 57
        table.register(FinanceTableViewCell.self, forCellReuseIdentifier: FinanceTableViewCell.identifier)
        table.separatorInset = UIEdgeInsets(top: 0, left: 62, bottom: 0, right: 16)
        table.layer.backgroundColor = UIColor.white.cgColor
        table.layer.cornerRadius = 31
        table.allowsSelectionDuringEditing = true
        return table
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Баланс"
        label.tintColor = .black
        label.font = UIFont(
            name: "Inter-SemiBold",
            size: 16
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "$1200.89"
        label.tintColor = .black
        label.font = UIFont(
            name: "Inter-Medium",
            size: 36
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackMonth: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 50
        return stack
    }()
    
    let monthLabel: UILabel = {
        let label = UILabel()
        label.text = "Апрель 2020"
        label.tintColor = .black
        label.font = UIFont(
            name: "Inter-Light",
            size: 18
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let leftButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "left"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let viewAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("См. ещё", for: .normal)
        let buttonFont = UIFont(name: "Inter-Regular", size: 16)
        button.titleLabel?.font = buttonFont
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(
            red: 248/255,
            green: 248/255,
            blue: 248/255,
            alpha: 1
        )
        configureView()
        setDataArray()
    }
}

extension MainViewController {
    
    func configureView() {
        configureTitleLabel()
        configureBalance()
        configureMonth()
        configureTableView()
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 14
            )
        ])
    }
    
    func configureBalance() {
        view.addSubview(balanceLabel)
        NSLayoutConstraint.activate([
            balanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            balanceLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 7
            )
        ])
    }
    
    func configureMonth() {
        view.addSubview(stackMonth)
        stackMonth.addArrangedSubview(leftButton)
        stackMonth.addArrangedSubview(monthLabel)
        stackMonth.addArrangedSubview(rightButton)
        
        NSLayoutConstraint.activate([
            stackMonth.topAnchor.constraint(
                equalTo: balanceLabel.bottomAnchor,
                constant: 30
            ),
            stackMonth.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rightButton.heightAnchor.constraint(equalToConstant: 50),
            leftButton.heightAnchor.constraint(equalToConstant: 50),
            
            rightButton.widthAnchor.constraint(equalToConstant: 50),
            leftButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        let headerView = UIView(
            frame:
                CGRect(
                    x: 0,
                    y: 0,
                    width: tableView.frame.width,
                    height: 7
                )
        )
        tableView.tableHeaderView = headerView
        
        let footerView = UIView(
            frame:
                CGRect(
                    x: 0,
                    y: 0,
                    width: tableView.frame.width,
                    height: 50
                )
        )
        footerView.addSubview(viewAllButton)
        tableView.tableFooterView = footerView
        viewAllButton.addTarget(self, action: #selector(touched), for: .touchDown)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: stackMonth.bottomAnchor,
                constant: 45),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -14),
            tableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 0),
            tableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            viewAllButton.topAnchor.constraint(
                equalTo: footerView.topAnchor,
                constant: 18
            ),
            viewAllButton.bottomAnchor.constraint(
                equalTo: footerView.bottomAnchor,
                constant: 0
            ),
            viewAllButton.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            viewAllButton.widthAnchor.constraint(equalToConstant: 162),
            viewAllButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayFinance.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: FinanceTableViewCell.identifier
        ) as! FinanceTableViewCell
        cell.setData(finance: arrayFinance[indexPath.row])
        return cell
    }
}

extension MainViewController {
    func setDataArray() {
        arrayFinance = [
            Finance(
                posterBGImage: "homebg",
                posterImage:  "home",
                titleLabel:  "Дом",
                expensesLabel:  "$321",
                descriptionLabel:  "Продукты"
            ),
            Finance(
                posterBGImage: "shopbg",
                posterImage:  "shop",
                titleLabel:  "Покупки",
                expensesLabel:  "$574",
                descriptionLabel:  "Одежда"
            ),
            Finance(
                posterBGImage: "vehicalbg",
                posterImage:  "vehical",
                titleLabel:  "Транспорт",
                expensesLabel:  "$124",
                descriptionLabel:  "Такси"
            ),
            Finance(
                posterBGImage: "healthbg",
                posterImage:  "health",
                titleLabel:  "Здоровье",
                expensesLabel:  "$765",
                descriptionLabel:  "Лечение"
            ),
            Finance(
                posterBGImage: "fitnesbg",
                posterImage:  "fitnes",
                titleLabel:  "Фитнес",
                expensesLabel:  "$324",
                descriptionLabel:  "Тренировки"
            ),
            Finance(
                posterBGImage: "accountsbg",
                posterImage:  "accounts",
                titleLabel:  "Счета",
                expensesLabel:  "$726",
                descriptionLabel:  "Комунальные"
            ),
            Finance(
                posterBGImage: "healthbg",
                posterImage:  "health",
                titleLabel:  "Ресторан",
                expensesLabel:  "$325",
                descriptionLabel:  "Ужин"
            )
        ]
    }
    
    @objc func touched() {
        print("button")
    }
}
