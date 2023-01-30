//
//  TaskProviderImplementation.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import Foundation

final class TaskProviderImplementation {

    // MARK: - Private properties

    private let storage: CoreDataStorage

    // MARK: - Initialization

    init(storage: CoreDataStorage) {
        self.storage = storage
    }

}

// MARK: - TaskProvider

extension TaskProviderImplementation: TaskProvider {

    func append(_ taskGroup: TaskGroup) {
        storage.create { (dto: TaskGroupDTO) in
            dto.name = taskGroup.name
            dto.id = taskGroup.id
        }
    }

    func append(_ task: Task) {
        storage.create { (dto: TaskDTO) in
            dto.id = task.id
            dto.taskDescription = task.description
            dto.isCompleted = task.isCompleted
            dto.groupID = task.groupID
        }
    }

    func getTaskGroups() -> [TaskGroup] {
        storage.readData()
            .map { (dto: TaskGroupDTO) in
                TaskGroup(name: dto.name, id: dto.id)
            }
    }

    func getTasks() -> [Task] {
        storage.readData()
            .map { (dto: TaskDTO) in
                Task(
                    id: dto.id,
                    description: dto.taskDescription,
                    isCompleted: dto.isCompleted,
                    groupID: dto.groupID
                )
            }
    }

    func update(_ taskGroup: TaskGroup) {
        storage.updateData(withID: taskGroup.id) { (dto: TaskGroupDTO) in
            dto.name = taskGroup.name
            dto.id = taskGroup.id
        }
    }

    func update(_ task: Task) {
        storage.updateData(withID: task.id) { (dto: TaskDTO) in
            dto.taskDescription = task.description
            dto.isCompleted = task.isCompleted
            dto.groupID = task.groupID
        }
    }

    func deleteTaskGroup(withID id: UUID) {
        storage.deleteData(typeOf: TaskGroupDTO.self, withID: id)
    }

    func deleteTask(withID id: UUID) {
        storage.deleteData(typeOf: TaskDTO.self, withID: id)
    }

}

// MARK: - Entities

struct TaskGroup {

    let id: UUID
    var name: String

    init(name: String) {
        self.name = name
        self.id = UUID()
    }

    fileprivate init(name: String, id: UUID) {
        self.name = name
        self.id = id
    }

}

struct Task {

    let id: UUID
    var description: String
    var isCompleted: Bool
    var groupID: UUID?

    init(description: String,
         isCompleted: Bool,
         groupID: UUID?) {
        self.id = UUID()
        self.description = description
        self.isCompleted = isCompleted
        self.groupID = groupID
    }

    fileprivate init(id: UUID,
                     description: String,
                     isCompleted: Bool,
                     groupID: UUID?) {
        self.id = id
        self.description = description
        self.isCompleted = isCompleted
        self.groupID = groupID
    }

}
