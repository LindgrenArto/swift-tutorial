//
//  TodoItem.swift
//  CoreDataTodo
//
//  Created by Arto Lindgren on 03/02/2020.
//  Copyright © 2020 Arto Lindgren. All rights reserved.
//

import Foundation
import CoreData

public class TodoItem:NSManagedObject, Identifiable {
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}

extension TodoItem {
    static func getAllTodoItems() -> NSFetchRequest<TodoItem> {
        let request : NSFetchRequest<TodoItem> = TodoItem.fetchRequest() as!
            NSFetchRequest<TodoItem>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
