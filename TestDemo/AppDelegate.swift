//
//  AppDelegate.swift
//  TestDemo
//
//  Created by xinguang hu on 2019/10/21.
//  Copyright © 2019 huxinguang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.backgroundColor = UIColor.white
        window?.rootViewController = initTabBarController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func initTabBarController() -> UITabBarController {
        let tabVC: UITabBarController = UITabBarController()
        tabVC.tabBar.barTintColor = UIColor.white
        tabVC.tabBar.isTranslucent = false
        
        let vc1 = LeftViewController()
        let vc2 = CenterViewController()
        let vc3 = RightViewController()
        let vcs = [vc1,vc2,vc3]
        let titles = ["Left","Center","Right"]
        for i in 0..<titles.count {
            let vc = vcs[i]
            vc.title = titles[i]
            let item = UITabBarItem(tabBarSystemItem: .favorites, tag: i)
            let nav = BaseNavigationController(rootViewController: vc)
            nav.tabBarItem = item
            tabVC.addChild(nav)
        }
        
        return tabVC
    }

    // MARK: UISceneSession Lifecycle

    /*
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    */


}

