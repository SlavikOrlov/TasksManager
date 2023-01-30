//
//  SceneDelegate.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var router: AppRouter?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        router = AppRouterImplementation(window: window)
        router?.start()
    }

}

