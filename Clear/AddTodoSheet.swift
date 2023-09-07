//
//  AddTodoSheet.swift
//  Clear
//
//  Created by Rajesh Khuntia on 30/08/23.
//

import SwiftUI

struct AddTodoSheet: View {
    @FocusState private var isFocused:Bool
    @Binding var isPresented: Bool
    @ObservedObject var todoList: TodoList
    @State private var newTodoTitle = ""
    @State private var newCaption=""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Todo")) {
                    TextField("Enter todo name", text: $newTodoTitle)
                    
                        .focused($isFocused)
                    TextField("Some extra", text: $newCaption)
                    
                        
                }
            }
            .navigationBarTitle("Add Todo", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Add") {
                    todoList.addTodo(title: newTodoTitle,caption: newCaption)
                    isPresented = false
                }.disabled(newTodoTitle.isEmpty)
            )
        }
        .onAppear(){
            isFocused=true
        }
    }
}

//#Preview {
//    AddTodoSheet()
//}
