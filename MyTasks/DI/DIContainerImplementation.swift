//
//  DIContainerImplementation.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import Foundation

final class DIContainerImplementation {

    // MARK: - Nested types

    enum DIError: Error {
        case cannotResolve
    }

    // MARK: - Private properties

    private let lock = NSLock()
    private var entityStorage: [String: Any] = [:]

}

// MARK: - Public Methods

extension DIContainerImplementation: DIContainer {

    func register<T>(_ entity: T) {
        lock.lock()
        entityStorage[String(describing: T.self)] = entity
        lock.unlock()
    }

    func resolve<T>() throws -> T {
        guard let entity = entityStorage[String(describing: T.self)] as? T else {
            throw DIError.cannotResolve
        }
        return entity
    }

}
