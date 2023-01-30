//
//  MainScreenPresenter.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

final class MainScreenPresenter {

    // MARK: - Private properties

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

    func startAddingTask() {
        router?.showTaskCreation(output: self)
    }

    func viewDidLoad() {
        view?.tasks = taskProvider.getTasks()
    }

    func taskDidSelect(_ task: Task) {
        var task = task
        task.isCompleted = true
        taskProvider.update(task)
    }

    func taskDidDeselect(_ task: Task) {
        var task = task
        task.isCompleted = false
        taskProvider.update(task)
    }

}

extension MainScreenPresenter: TaskCreationModuleOutput {

    func taskDidCreate() {
        view?.tasks = taskProvider.getTasks()
    }

}

