//
//  TaskDetailView.swift
//  App07-Todo-Firebase
//
//  Created by Brenda Saucedo on 21/09/22.
//

import SwiftUI

struct TaskDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var taskModel: TaskModel
    var mode: Mode
    @State var task: Task
    
    // Store the edited info of the task.
    @State var categoryEdit: String = "Sport"
    @State var priorityEdit: Int = 1
    @State var completedEdit: Bool = false
    @State var date = Date.now
    
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
                        Text("Nombre")
                            .bold()
                        
                        // Value
                        TextField("Tarea", text: $task.task)
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
                            Text("Categoría: ")
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
                                        task.category = categoryEdit
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
                            Text("Prioridad:")
                                .bold()
                            
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
                                            task.priority = priorityEdit
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
                        Text("Tarea completada:")
                            .bold()
                        
                        // Value
                        Text(String(completedEdit))
                            .foregroundColor(.blue)
                        Toggle("", isOn: $completedEdit)
                            .onChange(of: completedEdit) { value in
                                task.completed = completedEdit
                            }
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
                    
                    VStack {
                        
                        HStack {
                            
                            // Label
                            Text("Fecha Limite")
                                .bold()
                            
                            // Value
                            DatePicker("", selection: $date)
                                .frame(width: 230)
                                .onChange(of: date) { newValue in
                                    task.due_date = date
                                }
                            
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
            
        }
        .safeAreaInset(edge: .top, alignment: .center) {
            // Label to add/edit a task.
            Text(mode == .add ? "Agregar Tarea" : "Editar Tarea")
                .foregroundColor(.blue)
                .padding(.top,-30)
        }
        .onAppear {
            // Current values of a task depending on whether the
            // window is for editing or adding a task.
            categoryEdit = task.category
            priorityEdit = task.priority
            completedEdit = task.completed
            date = task.due_date
        }
        
    }
    
    // Allows to add a task.
    func addTask() {
        taskModel.addTask(task: task)
    }
    
    // Allows to edit a task.
    func editTask() {
        taskModel.updateTask(task: task)
    }
    
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(taskModel: TaskModel(), mode: .add, task: Task.dummy)
    }
}
