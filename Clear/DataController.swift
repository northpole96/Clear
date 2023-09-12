//
//  DataController.swift
//  Clear
//
//  Created by Rajesh Khuntia on 12/09/23.
//

import Foundation
import CoreData

class DataController:ObservableObject{
    
    let container=NSPersistentContainer(name: "Todom")
    
    init() {
        container.loadPersistentStores(){description ,error in
            if let error=error{
                print("Core Data failed to load: \(error.localizedDescription)")
                
            }
            
            
        }
    }
    
    
    func saveNewToDo(title: String,caption:String) -> Bool {
        
        let todo = Todo(context: container.viewContext)
        todo.id = UUID()
        todo.title = title
        todo.caption=caption
        todo.isCompletedd = false
        
        do {
            try container.viewContext.save()
            return true
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    func fetchItems() -> [Todo] {
        let fetchRequest = Todo.fetchRequest()
        
        do {
            let list = try container.viewContext.fetch(fetchRequest)
            return list
        } catch {
            
            //Printing the error
            print(error.localizedDescription)
            
            return [Todo]()
        }
    }
    
    func deleteItem(item: Todo) {
        container.viewContext.delete(item)
        try? container.viewContext.save()
    }
    
    func updateItem(item: Todo) {
        item.id = item.id
        item.title = item.title
        item.isCompletedd = item.isCompletedd
        
        try? container.viewContext.save()
    }
    
}
