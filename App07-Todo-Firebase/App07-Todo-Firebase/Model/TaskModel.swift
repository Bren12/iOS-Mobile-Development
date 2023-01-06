//
//  TaskModel.swift
//  App07-Todo-Firebase
//
//  Created by Brenda Saucedo on 21/09/22.
//

import SwiftUI
import FirebaseFirestore

class TaskModel: ObservableObject {
    
    @Published var tasks = [Task]()
    
    private let db = Firestore.firestore()
    
    // Initializer
    init() {
        fetchTasks()
    }
    
    // Get data from the database.
    func fetchTasks() {
        
        db.collection("Tasks").order(by: "due_date").addSnapshotListener { (querySnapshot, error) in
            
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            print(documents.count)
            
            self.tasks = documents.compactMap { queryDocumentSnapshot -> Task? in
                return try? queryDocumentSnapshot.data(as: Task.self)
            }
            
        }
        
    }
    
    // Function to add data to the database.
    func addTask(task: Task) {
        do {
            let _ = try db.collection("Tasks").addDocument(from: task)
        }
        catch {
            print(error)
        }
    }

    // Function to update data in the database.
    func updateTask(task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("Tasks").document(taskID).setData(from: task)
            }
            catch {
                print("There was an error while trying to update a task \(error.localizedDescription).")
            }
        }
    }

    // Function to delete data from the database.
    func deleteTask(task: Task) {
        if let taskID = task.id {
            db.collection("Tasks").document(taskID).delete { (error) in
                if let error = error {
                    print("Error removing document: \(error.localizedDescription)")
                }
            }
        }
    }
    
}
