//
//  TaskProvider.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import Foundation

protocol TaskProvider {
    func append(_ taskGroup: TaskGroup)
    func append(_ task: Task)
    func getTaskGroups() -> [TaskGroup]
    func getTasks() -> [Task]
    func update(_ taskGroup: TaskGroup)
    func update(_ task: Task)
    func deleteTaskGroup(withID id: UUID)
    func deleteTask(withID id: UUID)
}
