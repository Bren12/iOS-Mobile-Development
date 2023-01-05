//
//  App06_ToDos_CoreDataApp.swift
//  App06-ToDos-CoreData
//
//  Created by Brenda Saucedo on 01/09/22.
//

import SwiftUI

@main
struct App06_ToDos_CoreDataApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
