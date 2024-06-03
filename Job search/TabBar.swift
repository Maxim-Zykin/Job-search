//
//  TabBar.swift
//  Job search
//
//  Created by Максим Зыкин on 29.05.2024.
//

import Foundation
import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        tabBar.backgroundColor = .black
        tabBar.tintColor = Resources.ColorsTabBar.active
        tabBar.unselectedItemTintColor = Resources.ColorsTabBar.inactive
        createTabBar()
    }
    
    override func viewWillLayoutSubviews() {

    }
    
    private func createTabBar() {
        viewControllers = [
            createVC(viewController: SearchViewController(), title: "Поиск", image: UIImage(named: "Search")),
            createVC(viewController: FavoritesViewController(), title: "Избранное", image: UIImage(named: "Heart")),
            createVC(viewController: ResponsesViewController(), title: "Отклики", image: UIImage(named: "Responses")),
            createVC(viewController: MessagesViewController(), title: "Сообщения", image: UIImage(named: "Messages")),
            createVC(viewController: ProfileViewController(), title: "Профиль", image: UIImage(named: "profil"))
        ]
    }
    
    private func createVC(viewController: UIViewController, title: String?, image: UIImage?) ->UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
