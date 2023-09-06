//
//  KeyboardTopView.swift
//  Clear
//
//  Created by Rajesh Khuntia on 27/08/23.

import SwiftUI
import SwiftData

struct KeyboardTopView: View {
    
    enum FocusedField {
        case p2, p3
    }
    
    @FocusState private var focusedField: FocusedField?
    
    
    
    @FocusState var vv:Bool
    @State var peek=89
    @State var peek2="89"
    @State var peek3="89"
    @State var visibility=false
    let x=[12,32,33,43,45]
    func add(){
        visibility.toggle()
        if(visibility){
            focusedField = .p2
        }
    }
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Button(action: add, label: {
                    Image(systemName: "plus")
                })
                Spacer(minLength: 20)
                if(visibility){
                    VStack{
                        TextField("Add", text: $peek2).textFieldStyle(.roundedBorder)
                            .focused($focusedField,equals: .p2)
                        TextField("Add", text: $peek3).textFieldStyle(.roundedBorder)
                            .focused($focusedField,equals: .p3)
                    }
                    .onSubmit {
                        if(focusedField != .p2)
                        {focusedField = nil}
                        else{
                            focusedField = .p3
                        }
                    }
                }
                
                
            }
        }
        .padding(10)
    }
}
#Preview {
    KeyboardTopView()
}
