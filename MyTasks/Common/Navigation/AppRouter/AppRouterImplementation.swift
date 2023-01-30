//
//  AppRouterImplementation.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

final class AppRouterImplementation {

    // MARK: - Private properties

    private var window: UIWindow

    // MARK: - Initialization

    init(window: UIWindow) {
        self.window = window
    }
}

// MARK: - Public Methods

extension AppRouterImplementation: AppRouter {

    func start() {
        let module = MainScreenAssembler.assemble(router: self)
        window.rootViewController = UINavigationController(
            rootViewController: module.viewContoller
        )
        window.makeKeyAndVisible()
    }

}
