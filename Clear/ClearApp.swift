//
//  ClearApp.swift
//  Clear
//
//  Created by Rajesh Khuntia on 03/08/23.
//

import SwiftUI


@main
struct ClearApp: App {
//    @StateObject private var dataController = DataController()
    @StateObject var listViewModel:ListViewModel=ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(listViewModel)
            
                
//                .environment(\.managedObjectContext,dataController.container.viewContext)
        }
    }
}
