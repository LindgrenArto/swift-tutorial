//
//  ContentView.swift
//  CoreDataDoToV2
//
//  Created by Arto Lindgren on 03/02/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: TodoItem.getAllTodoItems()) var todoItems:FetchedResults<TodoItem>
    
    @State private var newTodoItem = ""
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("What's next?")) {
                    HStack{
                        TextField("New Item", text: self.$newTodoItem)
                        Button(action: {
                            let todoItem = TodoItem(context: self.managedObjectContext)
                            todoItem.title = self.newTodoItem
                            todoItem.createdAt = Date()
                            
                            do{
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            
                            self.newTodoItem = ""
                            
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }.disabled(newTodoItem.isEmpty)
                        
                    }.font(.headline)
                }
                
                Section(header: Text("To Do's")) {
                    ForEach(self.todoItems) {todoItem in
                        TodoItemView(title: todoItem.title!, createdAt: "\(todoItem.createdAt!)")
                    }.onDelete {IndexSet in
                        let deleteItem = self.todoItems[IndexSet.first!]
                        
                        self.managedObjectContext.delete(deleteItem)
                        
                        do{
                            try self.managedObjectContext.save()
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            .navigationBarTitle("My List")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
