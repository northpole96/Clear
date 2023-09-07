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
    var caption:String
    var isCompleted: Bool
    
}

class TodoList: ObservableObject {
    @Published var todos: [Todo] = [
    Todo(title: "Task done",caption: "sports", isCompleted: false),
   Todo(title: "Water Sports",caption: "fast forever", isCompleted: true),
   Todo(title: "Routine",caption: "fast", isCompleted: false),
   Todo(title: "Spalsh",caption: "you need clearance", isCompleted: true),
   Todo(title: "Zen",caption: "i can't", isCompleted: false),
   Todo(title: "Alfred",caption: "pulse", isCompleted: false),
   Todo(title: "About what",caption: "recent", isCompleted: true),
   Todo(title: "glow",caption: "tbd", isCompleted: false),
   Todo(title: "MAsk",caption: "tdm", isCompleted: false),
   Todo(title: "Cpmletion",caption: "not interested", isCompleted: true),
   Todo(title: "Share",caption: "what for", isCompleted: false),
   Todo(title: "Ground",caption: "who knows", isCompleted: false),
   
    
    ]
    
    
    var incompleteTodos: [Todo] {
        todos.filter { !$0.isCompleted }
    }
    
    var completedTodos: [Todo] {
        todos.filter { $0.isCompleted }
    }
    
    func addTodo(title: String,caption:String) {
        let newTodo = Todo(title: title,caption: caption, isCompleted: false)
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
