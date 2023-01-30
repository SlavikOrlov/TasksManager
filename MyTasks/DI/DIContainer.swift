//
//  DIContainer.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

protocol DIContainer {
    func register<T>(_ entity: T)
    func resolve<T>() throws -> T
}
