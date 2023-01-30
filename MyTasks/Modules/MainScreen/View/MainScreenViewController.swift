//
//  MainScreenViewController.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

class MainScreenViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var output: MainScreenViewOutput?

    // MARK: - Private Properties

    private var adapter: MainScreenTableViewAdapter?

    // MARK: - View Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
        configureTableView()
    }

}

// MARK: - Private Methods

extension MainScreenViewController: MainScreenViewInput {

    func configureBackground() {
        view.backgroundColor = .red
    }

    func configureTableView() {
        self.tableView.backgroundColor = .red
        self.tableView.separatorStyle = .none
    }

}
