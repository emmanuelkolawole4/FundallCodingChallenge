//
//  SceneDelegate.swift
//  FundallCodingChallenge
//
//  Created by FOLAHANMI KOLAWOLE on 17/02/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
   
   var window: UIWindow?
   
   
   func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      guard let _ = (scene as? UIWindowScene) else { return }
      if let windowScene = scene as? UIWindowScene {
         window = UIWindow(windowScene: windowScene)
         let landingPageViewController = MainNavigationController()
         window?.rootViewController = landingPageViewController
         window?.makeKeyAndVisible()
      }
   }
   
   func sceneDidDisconnect(_ scene: UIScene) {}
   
   func sceneDidBecomeActive(_ scene: UIScene) {}
   
   func sceneWillResignActive(_ scene: UIScene) {}
   
   func sceneWillEnterForeground(_ scene: UIScene) {}
   
   func sceneDidEnterBackground(_ scene: UIScene) {}
   
   
}

