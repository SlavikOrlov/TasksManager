//
//  CoreDataStorage.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import CoreData

protocol CoreDataStorage {
    func create<T: NSManagedObject>(onSetup: (T) -> Void)
    func readData<T>() -> [T]
    func updateData<T>(withID id: UUID, onUpdate: (T) -> Void)
    func deleteData<T: NSManagedObject>(typeOf: T.Type, withID id: UUID)
}
