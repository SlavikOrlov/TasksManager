//
//  TaskCreationPresenter.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

final class TaskCreationPresenter {

    // MARK: - Private properties

    private weak var view: TaskCreationViewInput?
    private weak var output: TaskCreationModuleOutput?
    private weak var router: AppRouter?
    private var taskProvider: TaskProvider

    // MARK: - Initialization

    init(view: TaskCreationViewInput,
         output: TaskCreationModuleOutput,
         router: AppRouter,
         taskProvider: TaskProvider) {
        self.view = view
        self.output = output
        self.router = router
        self.taskProvider = taskProvider
    }

}

extension TaskCreationPresenter: TaskCreationViewOutput {

    func saveTask(description: String) {
        let task = Task(
            description: description,
            isCompleted: false,
            groupID: nil
        )
        taskProvider.append(task)
        output?.taskDidCreate()
        router?.dismissModule()
    }

}
