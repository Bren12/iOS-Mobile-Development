//
//  TaskListView.swift
//  App06-ToDos-CoreData
//
//  Created by Brenda Saucedo on 01/09/22.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.priority, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<Task>
    
    // Variables
    @State private var priority: [Priority] = Priority.priority
    @State private var category: [Category] = Category.categories
    
    // Date Formatter
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                List {
                    
                    // Section name
                    Section("Tasks") {
                        
                        // Displays the data of the "task" array.
                        ForEach(tasks) { task in
                            
                            // Navigate to another screen with the
                            // selected task.
                            NavigationLink {
                                TaskDetailView(mode: .edit, task: task)
                            } label: {
                                
                                HStack {
                                    
                                    // Vertical line with the color of the priority.
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(priority[findPriority(prior: task.priority_wrapped)].color)
                                        .frame(width: 5)
                                        .shadow(radius: 2)
                                        .opacity(task.completed ? 0.5 : 1)
                                    
                                    Spacer()
                                        .frame(width: 20)
                                    
                                    // Circle that marks if the task was completed or not.
                                    Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(task.completed ? .gray : .blue)
                                    
                                    Spacer()
                                        .frame(width: 20)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        // Task name
                                        Text(task.completed_wrapped ? "~~\(task.task_wrapped)~~" : "\(task.task_wrapped)")
                                            .bold()
                                            .foregroundColor(task.completed ? .gray : .black)
                                        
                                        HStack {
                                            
                                            // Task due date
                                            Image(systemName: "calendar.badge.clock")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(.gray)
                                            Text(task.completed_wrapped ? "~~\(dateFormat.string(from: task.date_wrapped))~~" : "\(dateFormat.string(from: task.date_wrapped))")
                                                .foregroundColor(.gray)
                                                .font(.custom("", size: 10))
                                            
                                            // Divider
                                            Text("|")
                                                .foregroundColor(.gray)
                                                .font(.custom("", size: 10))
                                            
                                            // Task category icon
                                            Image(category[findCategory(categ: task.category_wrapped)].image)
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                                .opacity(task.completed ? 0.5 : 1)
                                            
                                            // Task category
                                            Text(task.completed_wrapped ? "~~\(task.category_wrapped)~~" : "\(task.category_wrapped)")
                                                .foregroundColor(.gray)
                                                .font(.custom("", size: 10))
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.vertical,10)
                                
                            }
                            
                        }
                        // Performs task deletion when requested.
                        .onDelete(perform: deleteTasks)
                        
                    }
                    
                }
                
                VStack {
                    
                    Spacer()
                    
                    // Navigate to another screen with the
                    // selected task.
                    NavigationLink {
                        TaskDetailView(mode: .add, task: Task())
                    } label: {
                        // Display the plus (+) icon.
                        Image(systemName: "plus")
                            .font(.largeTitle)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    
                }
                .padding(.bottom, 60)
                
            }
            // Allows the environment’s editMode.
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            
        }
        
    }
    
    // Allows to delete a task.
    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate.
                // You should not use this function in a shipping application, although it
                // may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // Find priority ID to enable display its color in the vertical line.
    func findPriority(prior: Int16) -> Int {
        if let index = priority.firstIndex(where: {$0.priority == prior}) {
            return priority[index].id
        }
        return -1
    }
    
    // Find category ID to enable display its icon.
    func findCategory(categ: String) -> Int {
        if let index = category.firstIndex(where: {$0.category == categ}) {
            return category[index].id
        }
        return -1
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
