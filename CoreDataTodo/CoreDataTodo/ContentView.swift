//
//  ContentView.swift
//  CoreDataTodo
//
//  Created by Arto Lindgren on 03/02/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToodoItem.getAllTodoItems()) var toodoItems:FetchedResults<ToodoItem>
    
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
                        }
                        
                    }.font(.headline)
                }
                Section(header: Text("To Do's")) {
                    ForEach(self.toodoItems) {toodoitem in
                        TodoItemView(title: toodoitem.title!, createdAt: "\(toodoitem.createdAt!)")
                    }.onDelete {IndexSet in
                        let deleteItem = self.toodoItems[IndexSet.first!]
                        
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
