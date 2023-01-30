//
//  MainScreenPresenter.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

final class MainScreenPresenter {

    // MARK: - Internal properties

    private weak var view: MainScreenViewInput?
    private weak var router: AppRouter?
    private var taskProvider: TaskProvider

    // MARK: - Initialization

    init(view: MainScreenViewInput,
         router: AppRouter,
         taskProvider: TaskProvider) {
        self.view = view
        self.router = router
        self.taskProvider = taskProvider
    }

}

// MARK: - Public Methods

extension MainScreenPresenter: MainScreenViewOutput {

}
