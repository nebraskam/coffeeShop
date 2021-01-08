//
//  AppDelegate.swift
//  CoffeeShop
//
//  Created by n.melendez.azocar on 12/16/20.
//  Copyright © 2020 nebraska. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let homeViewController = HomeViewController(coffeeShop: CoffeeShop.shared)
        let orderViewController = OrderViewController()
        CoffeeShop.shared.subscribe(orderViewController)
        let homeNavigationVC = UINavigationController(rootViewController: homeViewController)
        let orderNavigationVC = UINavigationController(rootViewController: orderViewController)
        
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        orderViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)

        let tabController = UITabBarController()
        tabController.viewControllers = [homeNavigationVC, orderNavigationVC]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabController
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        return true
    }


}
