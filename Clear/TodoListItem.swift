//
//  TodoListItem.swift
//  Clear
//
//  Created by Rajesh Khuntia on 30/08/23.
//

import SwiftUI
import UIKit

struct TodoListItem: View {
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy) // Initialize feedback generator
    @EnvironmentObject private var todoList: TodoList
    @State private var isEditSheetPresented = false
    @State private var isCompleted: Bool
    
    let todo: Todo
    
    init(todo: Todo) {
        self.todo = todo
        _isCompleted = State(initialValue: todo.isCompleted)
    }
    
    
    var body: some View {
        HStack{
//            Toggle("", isOn: $isCompleted)
            Toggle("", isOn: Binding(get: { todo.isCompleted }, set: { newValue in
                feedbackGenerator.impactOccurred()
                withAnimation(){
                    todoList.editTodo(at: todoIndex(todo: todo), newTitle: todo.title, isCompleted: newValue)}
            }))
                .toggleStyle(CheckboxToggleStyle2())
                .onChange(of: isCompleted) { newValue in
                   
                  
                    withAnimation(){
                        todoList.editTodo(at: todoIndex(todo: todo), newTitle: todo.title, isCompleted: isCompleted)
                    }
                    
                }
//                .sensoryFeedback(.success, trigger: isCompleted)
            VStack(alignment:.leading){
                Text(todo.title).fontWeight(.medium)
                Text(todo.caption).font(.caption)
            }
            Spacer()
        }
        
        
//        .listRowSeparator(.hidden)
//        .listRowBackground(Color(hex: 0xFFC300))
        .contentShape(Rectangle())
        .onTapGesture {
            isEditSheetPresented = true
            
        }
        
        .sheet(isPresented: $isEditSheetPresented) {
            EditTodoSheet(isPresented: $isEditSheetPresented, todoList: todoList, todo: todo,isComplete: $isCompleted)
            
        }
    }
    
    private func todoIndex(todo: Todo) -> Int {
        guard let index = todoList.todos.firstIndex(where: { $0.id == todo.id }) else {
            fatalError("Todo not found")
        }
        return index
    }
}


//#Preview {
//    TodoListItem()
//}
//}
