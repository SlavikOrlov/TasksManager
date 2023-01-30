//
//  ContainerAssembler.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

final class ContainerAssembler {

    static func makeContainer() -> DIContainer {
        let container = DIContainerImplementation()
        let localStorage = CoreDataStorageImplementation()
        let taskProvider = TaskProviderImplementation(storage: localStorage)
        container.register(localStorage as CoreDataStorage)
        container.register(taskProvider as TaskProvider)
        return container
    }

}
