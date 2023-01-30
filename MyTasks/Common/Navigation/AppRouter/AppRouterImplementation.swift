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
    private var container: DIContainer

    // MARK: - Initialization

    init(window: UIWindow, container: DIContainer) {
        self.window = window
        self.container = container
    }

}

// MARK: - Public Methods

extension AppRouterImplementation: AppRouter {

    func start() {
        do {
            let module = MainScreenAssembler.assemble(
                router: self,
                taskProvider: try container.resolve()
            )
            window.rootViewController = UINavigationController(
                rootViewController: module.viewContoller
            )
            window.makeKeyAndVisible()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }

}
