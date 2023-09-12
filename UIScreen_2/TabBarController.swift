//
//  TabBarController.swift
//  UIScreen_2
//
//  Created by Nazerke Sembay on 11.09.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: MainViewController(),
                title: "Главная",
                image: UIImage(named: "main")
            ),
            
            generateVC(
                viewController: ReportsViewController(),
                title: "Отчеты",
                image: UIImage(named: "reports")
            ),
            
            generateVC(
                viewController: ProfileViewController(),
                title: "Профиль",
                image: UIImage(named: "profile")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.image = image
        viewController.tabBarController?.title = title
        return viewController
    }
    
    private func setTabBarAppearance() {
        tabBar.tintColor = .black
        tabBar.barTintColor = .red
//        UIColor(
//            red: 242/255,
//            green: 242/255,
//            blue: 242/255,
//            alpha: 0.9
//        )
        tabBar.alpha = 1
        tabBar.items?[0].selectedImage = UIImage(named: "mainSelected")?.withRenderingMode(.alwaysOriginal)
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor(
            red: 185/255,
            green: 193/255,
            blue: 217/255,
            alpha: 0.5
        )
        lineView.frame = CGRect(
            x: 0,
            y: 0,
            width: tabBar.frame.size.width,
            height: 1
        )
        tabBar.addSubview(lineView)
    }
}

