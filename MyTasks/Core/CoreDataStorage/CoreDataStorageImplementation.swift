//
//  CoreDataStorageImplementation.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import CoreData

final class CoreDataStorageImplementation {

    // MARK: - Private properties

    private let lock = NSLock()

    private let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SavingLocalData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

}

// MARK: - CoreDataStorage

extension CoreDataStorageImplementation: CoreDataStorage {

    func create<T: NSManagedObject>(onSetup: (T) -> Void) {
        lock.lock()
        defer {
            lock.unlock()
        }
        let object = T(context: container.viewContext)
        onSetup(object)
        saveContext()
    }

    func readData<T>() -> [T] {
        lock.lock()
        defer {
            lock.unlock()
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
            entityName: String(describing: T.self)
        )
        let data = (try? container.viewContext.fetch(fetchRequest) as? [T]) ?? []
        return data
    }

    func updateData<T>(withID id: UUID, onUpdate: (T) -> Void) {
        lock.lock()
        defer {
            lock.unlock()
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
            entityName: String(describing: T.self)
        )
        fetchRequest.predicate = NSPredicate(format: "id == %@", id.uuidString)
        guard let data = (try? container.viewContext.fetch(fetchRequest) as? [T])?.first else { return }
        onUpdate(data)
        saveContext()
    }

    func deleteData<T: NSManagedObject>(typeOf: T.Type, withID id: UUID) {
        lock.lock()
        defer {
            lock.unlock()
        }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(
            entityName: String(describing: T.self)
        )
        fetchRequest.predicate = NSPredicate(format: "id == %@", id.uuidString)
        guard let data = (try? container.viewContext.fetch(fetchRequest) as? [T])?.first else { return }
        container.viewContext.delete(data)
        saveContext()
    }

}

// MARK: - Private methods

private extension CoreDataStorageImplementation {

    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                container.viewContext.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
