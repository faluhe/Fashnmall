//
//  AppDelegate.swift
//  Fashnmall
//
//  Created by Ismailov Farrukh on 2021/4/16.
//

import UIKit

@main
    class AppDelegate: UIResponder, UIApplicationDelegate {
        
        var window: UIWindow?
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            let initialViewController = storyboard.instantiateViewController(withIdentifier: "MainTabBarVC") as! MainTabBarVC
            
            window?.rootViewController = initialViewController
            window?.makeKeyAndVisible()
            return true
        }
        
        
         
    }

    

    

 

