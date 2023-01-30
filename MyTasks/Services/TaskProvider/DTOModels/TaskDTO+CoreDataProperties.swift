//
//  TaskDTO+CoreDataProperties.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//
//

import Foundation
import CoreData


extension TaskDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskDTO> {
        return NSFetchRequest<TaskDTO>(entityName: "TaskDTO")
    }

    @NSManaged public var groupID: UUID?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var taskDescription: String
    @NSManaged public var id: UUID

}

extension TaskDTO : Identifiable {

}
