//
//  SceneDelegate.swift
//  SSASideMenuExample
//
//  Created by Sebastian Andersen on 20/10/14.
//  Copyright (c) 2014 Sebastian Andersen. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        if let window = window {

            window.rootViewController = sideMenu
            window.makeKeyAndVisible()
        }
    }

    lazy var sideMenu: SSASideMenu = {

        let vc = HomeViewController()
        let nc = UINavigationController(rootViewController: vc)

        let leftMenuVC = LeftMenuViewController()
        let rightMenuVC = RightMenuViewController()

        let backgroundImage = UIImage(named: "Background.jpg")
        let sideMenu = SSASideMenu(contentViewController: nc,
                                   leftMenuViewController: leftMenuVC,
                                   rightMenuViewController: rightMenuVC)
        sideMenu.backgroundImage = backgroundImage
        sideMenu.configure(SSASideMenu.MenuViewEffect(fade: true, scale: true, scaleBackground: false))
        sideMenu.configure(SSASideMenu.ContentViewEffect(alpha: 1.0, scale: 0.7))
        sideMenu.configure(SSASideMenu.ContentViewShadow(enabled: true, color: UIColor.black, opacity: 0.6, radius: 6.0))
        //sideMenu.delegate = self

        return sideMenu
    }()

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
    }
}

/*
extension SceneDelegate: SSASideMenuDelegate {

    func sideMenuWillShowMenuViewController(_ sideMenu: SSASideMenu, menuViewController: UIViewController) {
        print("Will Show \(menuViewController)")
    }
    
    func sideMenuDidShowMenuViewController(_ sideMenu: SSASideMenu, menuViewController: UIViewController) {
        print("Did Show \(menuViewController)")
    }
    
    func sideMenuDidHideMenuViewController(_ sideMenu: SSASideMenu, menuViewController: UIViewController) {
        print("Did Hide \(menuViewController)")
    }
    
    func sideMenuWillHideMenuViewController(_ sideMenu: SSASideMenu, menuViewController: UIViewController) {
        print("Will Hide \(menuViewController)")
    }

    func sideMenuDidRecognizePanGesture(_ sideMenu: SSASideMenu, recognizer: UIPanGestureRecognizer) {
        print("Did Recognize PanGesture \(recognizer)")
    }
}
*/
