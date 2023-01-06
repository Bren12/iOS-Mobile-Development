//
//  TaskListView.swift
//  App07-Todo-Firebase
//
//  Created by Brenda Saucedo on 19/09/22.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject var taskModel = TaskModel()
    @State private var priority: [Priority] = Priority.priority
    @State private var category: [Category] = Category.categories
    
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
                    Section("Tareas") {
                        
                        // Displays the data of the "tasks" array.
                        ForEach(taskModel.tasks) { task in
                            
                            // Navigate to another screen with the
                            // selected task.
                            NavigationLink {
                                TaskDetailView(taskModel: taskModel, mode: .edit, task: task)
                            } label: {
                                
                                HStack {
                                    
                                    // Vertical line with the color of the priority.
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(priority[findPriority(prior: task.priority)].color)
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
                                    
                                    // Task name
                                    VStack(alignment: .leading) {
                                        
                                        Text(task.completed ? "~~\(task.task)~~" : "\(task.task)")
                                            .bold()
                                            .foregroundColor(task.completed ? .gray : .black)
                                        
                                        HStack {
                                            
                                            // Task due date
                                            Image(systemName: "calendar.badge.clock")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(.gray)
                                            Text(task.completed ? "~~\(dateFormat.string(from: task.due_date))~~" : "\(dateFormat.string(from: task.due_date))")
                                                .foregroundColor(.gray)
                                                .font(.custom("", size: 10))
                                            
                                            // Divider
                                            Text("|")
                                                .foregroundColor(.gray)
                                                .font(.custom("", size: 10))
                                            
                                            // Task category icon
                                            Image(category[findCategory(categ: task.category)].image)
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                                .opacity(task.completed ? 0.5 : 1)
                                            
                                            // Task category
                                            Text(task.completed ? "~~\(task.category)~~" : "\(task.category)")
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
                        TaskDetailView(taskModel: taskModel, mode: .add, task: Task.dummy)
                    } label: {
                        // Display the plus (+) icon.
                        Image(systemName: "plus")
                            .font(.largeTitle)
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    
                }
                
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
    func deleteTasks(offsets: IndexSet) {
        for index in offsets {
            taskModel.deleteTask(task: taskModel.tasks[index])
        }
    }
    
    // Find priority ID to enable display its color in the vertical line.
    func findPriority(prior: Int) -> Int {
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

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
