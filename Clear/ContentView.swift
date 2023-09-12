import SwiftUI





struct ContentView: View {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var todos: FetchedResults<Todo>
    @EnvironmentObject var listViewModel:ListViewModel
    @State private var isSheetPresented = false
    @State private var newTodoTitle = ""
    
    var body: some View {
        NavigationView {
            VStack {

                
                List {
                    Section(header: Text("Incomplete Todos")) {
                        ForEach(listViewModel.todos) { todo in
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
                AddTodoSheet(isPresented: $isSheetPresented)
            }
        }
        .onAppear(){
            
            listViewModel.getItems()
            
        }
        
    }
    
    private func deleteTodo(at offsets: IndexSet) {
        listViewModel.deleteItems(indexSet: offsets)
        listViewModel.getItems()
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
//            .environmentObject(ListViewModel())
    }
}
