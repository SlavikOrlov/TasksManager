//
//  ViewController.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties

    var taskProvider: TaskProvider?

    // MARK: - View Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        taskProvider = TaskProviderImplementation(storage: CoreDataStorageImplementation())
//        localStorage?.append(TaskGroup(name: "Group 1"))
//        localStorage?.append(TaskGroup(name: "Group 2"))
//        localStorage?.append(TaskGroup(name: "Group 3"))
//        localStorage?.append(TaskGroup(name: "Group 4"))
        print(taskProvider?.getTaskGroups())
        print("---------")
        guard var firstTaskGroup = taskProvider?.getTaskGroups().first else { return }
        firstTaskGroup.name = "New group"
        print(taskProvider?.update(firstTaskGroup))
        print("---------")
        print(taskProvider?.getTaskGroups())
        print(taskProvider?.deleteTaskGroup(withID: firstTaskGroup.id))
        print("---------")
        print(taskProvider?.getTaskGroups())
    }

}
