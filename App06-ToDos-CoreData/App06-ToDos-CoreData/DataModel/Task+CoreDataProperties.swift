//
//  Task+CoreDataProperties.swift
//  App06-ToDos-CoreData
//
//  Created by Brenda Saucedo on 19/09/22.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var category: String?
    @NSManaged public var completed: Bool
    @NSManaged public var date_created: Date?
    @NSManaged public var due_date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var priority: Int16
    @NSManaged public var task: String?
    
    var task_wrapped: String {
        task ?? ""
    }
    
    var category_wrapped: String {
        category ?? ""
    }
    
    var priority_wrapped: Int16 {
        priority
    }
    
    var completed_wrapped: Bool {
        completed
    }
    
    var date_wrapped: Date {
        due_date ?? Date()
    }


}

extension Task : Identifiable {

}
