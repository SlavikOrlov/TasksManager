//
//  MainScreenAssembler.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

final class MainScreenAssembler {

    static func assemble(
        router: AppRouter,
        taskProvider: TaskProvider) -> Presentable {
        let view = MainScreenViewController()
        let presenter = MainScreenPresenter(
            view: view,
            router: router,
            taskProvider: taskProvider
        )
        view.output = presenter
        return view
    }

}
