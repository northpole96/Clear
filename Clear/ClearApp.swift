//
//  ClearApp.swift
//  Clear
//
//  Created by Rajesh Khuntia on 03/08/23.
//

import SwiftUI


@main
struct ClearApp: App {
    @StateObject private var todoList = TodoList()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(todoList)
        }
    }
}
