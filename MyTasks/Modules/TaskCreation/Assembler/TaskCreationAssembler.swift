//
//  TaskCreationAssembler.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

final class TaskCreationAssembler {

    static func assemble(router: AppRouter,
                         output: TaskCreationModuleOutput,
                         taskProvider: TaskProvider) -> Presentable {
        let view = TaskCreationViewController()
        let presenter = TaskCreationPresenter(
            view: view,
            output: output,
            router: router,
            taskProvider: taskProvider
        )
        view.output = presenter
        return view
    }

}
