import SwiftUI





struct ContentView: View {
    @EnvironmentObject private var todoList: TodoList
    @State private var isSheetPresented = false
    @State private var newTodoTitle = ""
    
    var body: some View {
        NavigationView {
            VStack {
//                List {
//                    ForEach(todoList.todos) { todo in
//                        TodoListItem(todo: todo)
//                    }
//                    .onDelete(perform: deleteTodo)
//                    
//                   
//                    
//                }
                
                List {
                    Section(header: Text("Incomplete Todos")) {
                        ForEach(todoList.todos) { todo in
                            TodoListItem(todo: todo)
                        }
                        .onDelete(perform: deleteTodo)
                    }
                    
                
                }

                
                
           
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        isSheetPresented=true
                    }
                    .padding()
                    
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                AddTodoSheet(isPresented: $isSheetPresented, todoList: todoList)
            }
        }
        .onAppear(){
            
//            todoList.sortTodos()
        }
        
    }
    
    private func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            todoList.deleteTodo(at: index)
        }
    }
    
    func generateRandomDate()->Date {
        let currentDate = Date()
        let randomTimeInterval = TimeInterval.random(in: -365.0 * 24.0 * 60.0 * 60.0*3.0 ... 0.0) // Random interval for the past year
        return currentDate.addingTimeInterval(randomTimeInterval)
    }
    
   
 
}









@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
