//
//  EditTodoSheet.swift
//  Clear
//
//  Created by Rajesh Khuntia on 30/08/23.
//

import SwiftUI

struct EditTodoSheet: View {
    @FocusState private var isFocused:Bool
    @Binding var isPresented: Bool
    @ObservedObject var todoList: TodoList
    var todo: Todo
    @Binding var isComplete: Bool // Add this line

    @State private var editedTitle: String
//    @State private var isComplete:Bool
    
    init(isPresented: Binding<Bool>, todoList: TodoList, todo: Todo,isComplete: Binding<Bool>) {
        self._isPresented = isPresented
        self.todoList = todoList
        self.todo = todo
        _editedTitle = State(initialValue: todo.title)
        self._isComplete = isComplete // Initialize isCompleted

    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Todo")) {
                    TextField("Enter todo name", text: $editedTitle)
                        .focused($isFocused)
                }
                Toggle( isOn: $isComplete){Text("Status")}
                
            }
            .navigationBarTitle("Edit Todo", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Save") {
                    todoList.editTodo(at: todoIndex(todo: todo), newTitle: editedTitle,isCompleted: isComplete)
                    isPresented = false
                    print(todoList.todos)
                }.disabled(editedTitle.isEmpty)
            )
        }
        .onAppear(){
            isFocused=true
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
//    EditTodoSheet()
//}
