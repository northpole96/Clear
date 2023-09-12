//
//  EditTodoSheet.swift
//  Clear
//
//  Created by Rajesh Khuntia on 30/08/23.
//

import SwiftUI

struct EditTodoSheet: View {
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var listViewModel:ListViewModel
    @FocusState private var isFocused:Bool
    @Binding var isPresented: Bool
   @ObservedObject var todo: Todo
//    @Binding var isComplete: Bool
//    @ObservedObject  var todo:
    @State private var editedTitle: String
    @State private var editedCaption: String
    @State private var completionStatus:Bool
    init(isPresented: Binding<Bool>, todo: Todo) {
        self._isPresented = isPresented
        self.todo = todo
        _editedTitle = State(initialValue: todo.title!)
        _editedCaption = State(initialValue: todo.caption!)
        _completionStatus=State(initialValue: todo.isCompletedd)

    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Todo")) {
                    
                    TextField("Enter todo name", text: $editedTitle)
                            .focused($isFocused)
                    TextField("Enter todo name", text:$editedCaption)

                    
                }
                Section{
                    Toggle( isOn: $completionStatus){Text("Status")}
                }
                
//For Delete Operation
//                Section{
//                    
//                    Button( role: .destructive, action: {todoList.deleteTodo(at: todoIndex(todo: todo))})
//                    {
//                        Text("Delete")
//                    }
//                }
                
            }
            .navigationBarTitle("Edit Todo", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Save") {
                    triggerImpactHapticFeedback()
                    todo.title=editedTitle
                    todo.caption=editedCaption
                    todo.isCompletedd=completionStatus
                    listViewModel.updateItem(item: todo)
                    isPresented = false
                    
                }.disabled(todo.title!.isEmpty)
            )
        }
        .onAppear(){
            isFocused=true
        }
    }

    
//    private func todoIndex(todo: Todo) -> Int {
//        guard let index = todoList.todos.firstIndex(where: { $0.id == todo.id }) else {
//            fatalError("Todo not found")
//        }
//        return index
//    }
    
    
    func triggerImpactHapticFeedback() {
        let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
        impactGenerator.prepare()
        impactGenerator.impactOccurred()
    }
}


//#Preview {
//    EditTodoSheet()
//}
