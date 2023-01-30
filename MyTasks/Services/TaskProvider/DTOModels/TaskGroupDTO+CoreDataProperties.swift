//
//  TaskGroupDTO+CoreDataProperties.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//
//

import Foundation
import CoreData


extension TaskGroupDTO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskGroupDTO> {
        return NSFetchRequest<TaskGroupDTO>(entityName: "TaskGroupDTO")
    }

    @NSManaged public var name: String
    @NSManaged public var id: UUID

}

extension TaskGroupDTO : Identifiable {

}
