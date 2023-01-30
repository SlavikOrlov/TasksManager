//
//  MainScreenTableViewAdapter.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

final class MainScreenTableViewAdapter: NSObject {

    // MARK: - Private Properties

    private var tableView: UITableView

    // MARK: - Initialization and deinitialization

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTable()
    }

    // MARK: - Private methods

    func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension MainScreenTableViewAdapter: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MainScreenTableViewCell.identifier,
            for: indexPath)
        return cell
    }

}

// MARK: - UITableViewDelegate

extension MainScreenTableViewAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

}
