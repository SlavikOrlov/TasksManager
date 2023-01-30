//
//  MainScreenProtocols.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

protocol MainScreenViewInput: AnyObject {
    var tasks: [Task] { get set }
}

protocol MainScreenViewOutput: AnyObject {
    func startAddingTask()
    func viewDidLoad()
    func taskDidSelect(_ task: Task)
    func taskDidDeselect(_ task: Task)
}
