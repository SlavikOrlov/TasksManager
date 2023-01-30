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
    var tasks: [Task] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Private Properties

    private var tableView = UITableView()

    // MARK: - View Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        output?.viewDidLoad()
    }

}

// MARK: - Private Methods

extension MainScreenViewController: MainScreenViewInput {
}

// MARK: - Private methods

private extension MainScreenViewController {

    func configureUI() {
        title = NSLocalizedString("main_screen_title", comment: "")
        configureBackground()
        configureTableView()
        configureNavigationBar()
    }

    func configureBackground() {
        view.backgroundColor = AssetColor.white
    }

    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true
        tableView.register(
            TaskCell.self,
            forCellReuseIdentifier: String(describing: TaskCell.self)
        )
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped)
        )
    }

}

// MARK: - UITableViewDelegate

extension MainScreenViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let task = (tableView.cellForRow(at: indexPath) as? TaskCell)?.task else {
            return
        }
        output?.taskDidSelect(task)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let task = (tableView.cellForRow(at: indexPath) as? TaskCell)?.task else {
            return
        }
        output?.taskDidDeselect(task)
    }

}

// MARK: - UITableViewDataSource

extension MainScreenViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: TaskCell.self)
        ) as? TaskCell
        var configuration = cell?.defaultContentConfiguration()
        configuration?.text = tasks[indexPath.row].description
        cell?.contentConfiguration = configuration
        cell?.task = tasks[indexPath.row]
        if tasks[indexPath.row].isCompleted {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
        return cell ?? UITableViewCell()
    }

}

// MARK: - Actions

@objc
extension MainScreenViewController {
    func addTapped() {
        output?.startAddingTask()
    }
}
