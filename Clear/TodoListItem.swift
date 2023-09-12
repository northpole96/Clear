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
    @ObservedObject var todo:Todo
    @EnvironmentObject var listViewModel:ListViewModel
    
   
    

    @State private var isEditSheetPresented = false
    @State private var isCompleted: Bool
    
    
//    
    init(todo:Todo) {
        self.todo = todo
        _isCompleted = State(initialValue: todo.isCompletedd)
    }
    
    
    var body: some View {
        HStack{

            Toggle("", isOn: $isCompleted)
                .toggleStyle(CheckboxToggleStyle2())
                .onChange(of: isCompleted) { newValue in
                   
                    todo.isCompletedd=isCompleted
                    listViewModel.updateItem(item: todo)
                    print(todo.isCompletedd)
                    
                }
                .onChange(of: todo.isCompletedd){ newValue in
                
                    isCompleted=newValue
                    
                }
                

            VStack(alignment:.leading){
                Text(todo.title ?? "").fontWeight(.medium)
                Text(todo.caption ?? "").font(.caption)
//                Text(String(todo.isCompletedd))
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
            EditTodoSheet(isPresented: $isEditSheetPresented,todo: todo)
        
        }
    }
    
//    private func todoIndex(todo: Todo) -> Int {
//        guard let index = todoList.todos.firstIndex(where: { $0.id == todo.id }) else {
//            fatalError("Todo not found")
//        }
//        return index
//    }
}


//#Preview {
//    TodoListItem()
//}
//}
