//
//  MainTabBarViewController.swift
//  Kanji
//
//  Created by Luis Acosta on 8/5/22.
//

import UIKit


class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: DefinitionViewController())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "play")
        vc1.title = "Home"
        vc2.title = "Definition"
        tabBar.tintColor = .label
        setViewControllers([vc1,vc2], animated: false)
        
    }
}
