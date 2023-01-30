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
    private var navigationController: UINavigationController? {
        window.rootViewController as? UINavigationController
    }

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

    func dismissModule() {
        navigationController?.popViewController(animated: true)
    }

    func showTaskCreation(output: TaskCreationModuleOutput) {
        do {
            let module = TaskCreationAssembler.assemble(
                router: self,
                output: output,
                taskProvider: try container.resolve()
            )
            navigationController?.pushViewController(
                module.viewContoller,
                animated: true
            )
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }

}
