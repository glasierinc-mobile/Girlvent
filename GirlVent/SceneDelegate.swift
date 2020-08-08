//
//  SceneDelegate.swift
//  Girlvent
//
//  Created by Glasier Inc. on 17/12/19.
//  Copyright © 2019 Glasier Inc. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
         window?.overrideUserInterfaceStyle = .light
        if UserDefaults.standard.data(forKey:USER_LOGIN) == nil
                 {
                  guard let windowScene = (scene as? UIWindowScene) else { return }


                                              self.window = UIWindow(windowScene: windowScene)
                                              //self.window =  UIWindow(frame: UIScreen.main.bounds)
                                            self.window?.overrideUserInterfaceStyle = .light
                                              let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                       guard let rootVC = storyboard.instantiateViewController(identifier: "LoginVcPuch") as? LoginVc else {
                                                  print("ViewController not found")
                                                  return
                                              }
                                         let navigationController = UINavigationController.init(rootViewController: rootVC)

                                         navigationController.navigationBar.isHidden = true
                                              self.window?.rootViewController = navigationController
                                              self.window?.makeKeyAndVisible()
                 }
               

        
        
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
           
                let userDefaults = UserDefaults(suiteName: "group.com.Glasierinc.Girlventdemo")
        
         let sharedArray = userDefaults?.object(forKey: "img") as? [String : Any]
        
        let dict: [String : Any] = sharedArray!
        
        
        print(dict["name"] as Any)
      //  ["imgData" :  imgData!, "name" : self.contentText!]
        
    
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                         let therapiescall = storyboard.instantiateViewController(withIdentifier: "CreateImagePostVCpuch") as! CreateImagePostVC

                                    // let therapiescall = storyBoard.instantiateViewController(withIdentifier: "CreateImagePostVCpuch") as! CreateImagePostVC
                                   //  self.navigationController?.pushViewController(therapiescall, animated: true)
                         
                         let navVC = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
                         
                         navVC.viewControllers = [therapiescall]
                         self.window?.rootViewController = navVC
                         self.window?.makeKeyAndVisible()
                
             
    }

}

