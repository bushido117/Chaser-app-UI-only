//
//  TabBarController.swift
//  Chaser
//
//  Created by Вадим Сайко on 21.12.22.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private enum Tabs: Int {
        case overview
        case session
        case progress
        case settings
        
        var tabName: String {
            switch self {
            case .overview:
                return "Overview"
            case .session:
                return "Session"
            case .progress:
                return "Progress"
            case .settings:
                return "Settings"
            }
        }
        
        var iconName: String {
            switch self {
            case .overview:
                return "overview"
            case .session:
                return "session"
            case .progress:
                return "progress"
            case .settings:
                return "settings"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }

    private func configure() {
        let overviewController = UIViewController()
        let sessionController = UIViewController()
        let progressController = UIViewController()
        let settingsController = UIViewController()
        
        let overviewNavigationController = UINavigationController(rootViewController: overviewController)
        let sessionNavigationController = UINavigationController(rootViewController: sessionController)
        let progressNavigationController = UINavigationController(rootViewController: progressController)
        let settingsNavigationController = UINavigationController(rootViewController: settingsController)
        
        overviewController.tabBarItem = UITabBarItem(title: Tabs.overview.tabName,
                                                     image: UIImage(named: Tabs.overview.iconName),
                                                     tag: Tabs.overview.rawValue)
        sessionController.tabBarItem = UITabBarItem(title: Tabs.session.tabName,
                                                     image: UIImage(named: Tabs.session.iconName),
                                                     tag: Tabs.session.rawValue)
        progressController.tabBarItem = UITabBarItem(title: Tabs.progress.tabName,
                                                     image: UIImage(named: Tabs.progress.iconName),
                                                     tag: Tabs.progress.rawValue)
        settingsController.tabBarItem = UITabBarItem(title: Tabs.settings.tabName,
                                                     image: UIImage(named: Tabs.settings.iconName),
                                                     tag: Tabs.settings.rawValue)
        
        tabBar.tintColor = UIColor.active
        tabBar.barTintColor = UIColor.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = UIColor.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        setViewControllers([overviewNavigationController,
                            sessionNavigationController,
                            progressNavigationController,
                            settingsNavigationController], animated: false)
    }
}
