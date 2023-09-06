//
//  Todo.swift
//  Clear
//
//  Created by Rajesh Khuntia on 30/08/23.
//


import SwiftUI

struct Todo: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    
}

class TodoList: ObservableObject {
    @Published var todos: [Todo] = [
    Todo(title: "Task done", isCompleted: false),
    Todo(title: "Pet Bath", isCompleted: false),
    Todo(title: "Car wash", isCompleted: true),
    Todo(title: "Sunday Things", isCompleted: false),
    Todo(title: "Outing", isCompleted: true),
    Todo(title: "Astericks", isCompleted: false),
    Todo(title: "Till 3", isCompleted: true),
    Todo(title: "Focus", isCompleted: false),
    ]
    
    
    var incompleteTodos: [Todo] {
        todos.filter { !$0.isCompleted }
    }
    
    var completedTodos: [Todo] {
        todos.filter { $0.isCompleted }
    }
    
    func addTodo(title: String) {
        let newTodo = Todo(title: title, isCompleted: false)
        todos.append(newTodo)
    }
    
    func deleteTodo(at index: Int) {
        guard index >= 0 && index < todos.count else { return }
        todos.remove(at: index)
        
        
    }
    
    func editTodo(at index: Int, newTitle: String,isCompleted: Bool) {
        guard index >= 0 && index < todos.count else { return }
        todos[index].title = newTitle
        todos[index].isCompleted = isCompleted
        sortTodos()
        
        
      
        
        
        
    }
    
    
    
    
    func sortTodos() {
        todos.sort(by: { $0.isCompleted && !$1.isCompleted })
    }
}
