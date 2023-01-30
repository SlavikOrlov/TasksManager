//
//  MainScreenPresenter.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

final class MainScreenPresenter {

    // MARK: - Internal properties

    var output: MainScreenModuleOutput?
    weak var view: MainScreenViewInput?
    weak var router: AppRouter?
    
}

// MARK: - Public Methods

extension MainScreenPresenter: MainScreenViewOutput {

}
