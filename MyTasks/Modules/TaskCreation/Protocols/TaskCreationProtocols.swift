//
//  TaskCreationProtocols.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

protocol TaskCreationViewInput: AnyObject {
}

protocol TaskCreationViewOutput: AnyObject {
    func saveTask(description: String)
}

protocol TaskCreationModuleOutput: AnyObject {
    func taskDidCreate()
}
