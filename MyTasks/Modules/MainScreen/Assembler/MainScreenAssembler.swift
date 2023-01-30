//
//  MainScreenAssembler.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

final class MainScreenAssembler {

    static func assemble(router: AppRouter) -> Presentable {
        let view = MainScreenViewController()
        let presenter = MainScreenPresenter()
        presenter.view = view
        presenter.router = router
        view.output = presenter
        return view
    }

}
