//
//  AppDelegate.swift
//  Collection_View_Table_View
//
//  Created by Karthikeyan.L on 05/08/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                // Instantiate the view controller with the storyboard ID
                let dashBoardVC = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
                
                // Embed the first view controller in a navigation controller
                let navigationController = UINavigationController(rootViewController: dashBoardVC)
                
                // Set the navigation controller as the root view controller of the window
                window?.rootViewController = navigationController
                
                // Make the window key and visible
                window?.makeKeyAndVisible()

//                   let dashBoardVC = FirstViewController()
//                   let navigationController = UINavigationController(rootViewController: dashBoardVC)
//                   self.window?.rootViewController = navigationController
//                   navigationController.setNavigationBarHidden(true, animated: false)

        return true
    }

//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

