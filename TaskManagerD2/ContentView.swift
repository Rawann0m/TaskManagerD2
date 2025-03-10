//
//  ContentView.swift
//  TaskManagerD2
//
//  Created by Rawan on 10/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    //task list
    @State private var tasks: [Task] = []
    @State private var newTask: String = ""
    @State private var isDarkMode = false
    //sort the tasks
    var sortedTasks: [Task] {
        tasks.sorted { !$0.isCompleted && $1.isCompleted }
    }
    var body: some View {
        NavigationView {
            //vstack to show the textfiled and the add button and then the added tasks under eachother
            VStack {
                Text("Here is your To-Do List")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.trailing)
                    .padding(20)
                HStack {
                    TextField("Enter new task", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    //here is a button to add the tasks
                    Button(action: addTask) {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color("CustomColor"))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    .padding(.trailing)
                }
                
                List {
                    ForEach(sortedTasks) { task in
                        HStack {
                            //here i used systemname to show a check mark next to the completed tasks
                            Button(action: { toggleTaskCompletion(task: task) }) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(task.isCompleted ? .green : .gray)
                            }
                            
                            // and here i added a color and the line that goes through the task to show that is completed
                            Text(task.title)
                                .strikethrough(task.isCompleted, color: .gray)
                                .foregroundColor(task.isCompleted ? .gray : .primary)
                        }
                    }
                    //here to delete a task
                    .onDelete(perform: deleteTask)
                }
                //dark mood
                .listStyle(InsetGroupedListStyle())
                Toggle("Enable Dark Mode", isOn: $isDarkMode)
                    .padding()
            }
            //the title of the page
            .navigationTitle("To-Do List")
            
            
            
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    // the function for adding a task
    private func addTask() {
        guard !newTask.isEmpty else { return }
        tasks.append(Task(title: newTask, isCompleted: false))
        newTask = ""
    }
    // the function for the task completion
    private func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    //the function for deleting a task
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
