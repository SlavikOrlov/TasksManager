//
//  MainScreenViewController.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

class MainScreenViewController: UIViewController {

    // MARK: - Properties

    var output: MainScreenViewOutput?

    // MARK: - View Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

// MARK: - Public Methods

extension MainScreenViewController: MainScreenViewInput {
}
