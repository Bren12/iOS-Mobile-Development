//
//  TaskDetailView.swift
//  App06-ToDos-CoreData
//
//  Created by Brenda Saucedo on 01/09/22.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    // Variable that switch between the add and edit mode.
    var mode: Mode = .add
    // Store the task info.
    var task: Task
    
    // Store the edited info of the task.
    @State var taskEdit: String = ""
    @State var categoryEdit: String = "Fun"
    @State var priorityEdit: Int16 = 1
    @State var completedEdit: Bool = false
    @State var date = Date.now
    
    // Date Formatter
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    // Stores the background color.
    var colorBackG = Color(red: 242/255, green: 242/255, blue: 247/255)
    
    var body: some View {
        
        ZStack {
            
            // Background
            colorBackG
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Spacer()
                
                // TASK
                ZStack {
                    
                    // Background rectangle
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 380, height: 80)
                    
                    HStack {
                        
                        // Label
                        Text("Task Name")
                            .bold()
                        
                        // Value
                        TextField("Task", text: $taskEdit)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 260)
                        
                    }
                    
                }
                
                // Category
                ZStack {
                    
                    // Background rectangle
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 380, height: 130)
                    
                    VStack(spacing: 10) {
                        
                        HStack {
                            
                            // Label
                            Text("Category: ")
                                .bold()
                            
                            // Value
                            Text(categoryEdit)
                                .foregroundColor(.blue)
                            
                        }
                        
                        HStack {
                            
                            // Displays the icons of the "categories" array.
                            ForEach(Category.categories) { category in
                                Image(category.image)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .padding(.horizontal,10)
                                    .opacity(categoryEdit == category.category ? 1.0 : 0.3)
                                    .onTapGesture {
                                        categoryEdit = category.category
                                    }
                            }
                            
                        }
                        
                    }
                    
                }
                
                // Priority
                ZStack {
                    
                    // Background rectangle
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 380, height: 130)
                    
                    VStack(spacing: 10) {
                        
                        HStack {
                            
                            // Label
                            Text("Priority:")
                            
                            // Value
                            Text(String(priorityEdit))
                                .foregroundColor(.blue)
                            
                        }
                        
                        HStack {
                            
                            // Displays the colors of the "priority" array in rectangles.
                            ForEach(Priority.priority) { priority in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(priority.color)
                                        .frame(width: 110, height: 60)
                                        .opacity(priorityEdit == priority.priority ? 1.0 : 0.3)
                                        .onTapGesture {
                                            priorityEdit = priority.priority
                                        }
                                    VStack {
                                        Text(priority.text)
                                    }
                                }
                            }
                            
                        }
                        
                    }
                    
                }
                
                // Completed
                ZStack {
                    
                    // Background rectangle
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 380, height: 80)
                    
                    HStack {
                        
                        // Label
                        Text("Completed Task:")
                            .bold()
                        
                        // Value
                        Text(String(completedEdit))
                            .foregroundColor(.blue)
                        Toggle("", isOn: $completedEdit)
                            .frame(width: 60)
                        
                    }
                    
                }
                
                // Due Date
                ZStack {
                    
                    // Background rectangle
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .shadow(radius: 1)
                        .frame(width: 380, height: 80)
                    
                    HStack {
                        
                        // Label
                        Text("Deadline")
                            .bold()
                        
                        // Value
                        VStack {
                            DatePicker("", selection: $date)
                                .frame(width: 230)
                        }
                        
                    }
                    
                }
                
                Spacer()
                
                // To add/edit a task.
                Button {
                    if mode == .add {
                        addTask()
                    } else {
                        editTask()
                    }
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text(mode == .add ? "Agregar" : "Editar")
                        .font(.system(.largeTitle))
                        .frame(width: 250)
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                
            }
            .padding(.horizontal, 20)
            .safeAreaInset(edge: .top, alignment: .center) {
                // Label to add/edit a task
                Text(mode == .add ? "Agregar Tarea" : "Editar Tarea")
                    .foregroundColor(.blue)
                    .padding(.top,-30)
                
            }
            .onAppear {
                // Current values of a task depending on whether the
                // window is for editing or adding a task.
                if mode == .edit {
                    taskEdit = task.task_wrapped
                    categoryEdit = task.category_wrapped
                    priorityEdit = task.priority_wrapped
                    completedEdit = task.completed_wrapped
                    date = task.date_wrapped
                } else {
                    taskEdit = ""
                    categoryEdit = "Fun"
                    priorityEdit = 1
                    completedEdit = false
                    date = Date.now
                }
            }
            
        }
        
    }
    
    // Allows to add a task.
    private func addTask() {
        
        withAnimation {
            
            let newTask = Task(context: viewContext)
            newTask.id = UUID()
            newTask.task = taskEdit
            newTask.priority = priorityEdit
            newTask.category = categoryEdit
            newTask.due_date = date
            newTask.completed = completedEdit
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
        }
        
    }
    
    // Allows to edit a task.
    private func editTask() {
        
        withAnimation {
            
            viewContext.performAndWait {

                task.task = taskEdit
                task.category = categoryEdit
                task.priority = priorityEdit
                task.due_date = date
                task.completed = completedEdit
            
                do {
                    try viewContext.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
                
            }
            
        }
        
    }

}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task())
    }
}
