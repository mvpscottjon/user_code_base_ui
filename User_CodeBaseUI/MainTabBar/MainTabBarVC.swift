//
//  MainTabBarVC.swift
//  User_CodeBaseUI
//
//  Created by Seven on 2021/9/24.
//

import UIKit
import Alamofire

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        creatUI()
        bindUI()

    }
//
//    override var prefersStatusBarHidden: Bool{
//
//        return true
//    }
 
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }

}

extension MainTabBarVC{
    
    func creatUI(){
        self.view.backgroundColor = .white
        
        self.cofigNavAndTab()
        self.configVCs()
        
    }
    
    func bindUI(){
        
        _ = self.view.reactive.swipeGesture(numberOfTouches: 1, direction: .left).observeNext(with: { [weak self] _ in
            
            print("偵測到往左")
            
            if self?.selectedIndex == 0{
                
                self?.selectedIndex = 1
            }
            
        })
        
        _ = self.view.reactive.swipeGesture(numberOfTouches: 1, direction: .right).observeNext(with: { [weak self] _ in
            
            print("偵測到往右")
            
            if self?.selectedIndex == 1{
                
                self?.selectedIndex = 0
            }
            
        })
        
    }
    
    
    
}


extension MainTabBarVC{
    
    func cofigNavAndTab(){
        
        
//        let height = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

        
//        let statusBar =  UIView()
//        statusBar.frame = view.window?.windowScene?.statusBarManager?.statusBarStyle = .lightContent
//         statusBar.backgroundColor = UIColor.red
         
        
        
        
//        UINavigationBar.appearance().backgroundColor = .black
//        UINavigationBar.appearance().barTintColor = .black
//        UINavigationBar.appearance().isTranslucent = false
//
//        UITabBar.appearance().barTintColor = .white
//
//        UITabBar.appearance().tintColor = .black
        
        
       

    }
    
    func configVCs(){
        
        var vcs = [UIViewController]()
        
        
        
//        let listVC = UserListVC()
        
        let navListVC = UINavigationController(rootViewController:  UserListVC())
        
        navListVC.title = "User"
        navListVC.tabBarItem.image = UIImage(systemName: "person")
        
//        let mineVC = MineVC()
        
        let navMineVC = UINavigationController(rootViewController: MineVC())

        navMineVC.title = "Mine"
        navMineVC.tabBarItem.image = UIImage(systemName: "info.circle")

        
        vcs.append(navListVC)
        vcs.append(navMineVC)
        
        
        
        self.setViewControllers(vcs, animated: false)
        
        
        
    }
    
    
    
}


