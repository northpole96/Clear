//
//  ListViewModel.swift
//  Clear
//
//  Created by Rajesh Khuntia on 12/09/23.
//

import Foundation
import SwiftUI

class ListViewModel:ObservableObject{
    
    private let dataController=DataController()
    @Published var todos:[Todo]=[]
    init() {
        
    }
    func getItems() {
        todos=dataController.fetchItems()
    }
    
    func deleteItems(indexSet:IndexSet){
        indexSet.forEach { index in
            dataController.deleteItem(item: todos[index])
        }
        
        todos.remove(atOffsets: indexSet)
            
            
        
        
    }
    
//    
//    func moveItem(form:IndexSet, to: Int) {
//        todos.move(fromOffsets: form, toOffset: to)
//    }
    
    func addItem(title:String,caption:String) {
        if dataController.saveNewToDo(title: title,caption: caption) {
            getItems()
        }
    }
    
    func updateItem(item:Todo) {
        dataController.updateItem(item: item)
        getItems()
    }
    

    
}
