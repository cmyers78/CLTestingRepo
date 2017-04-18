//
//  ItemManager.swift
//  ToDo
//
//  Created by Christopher Myers on 4/18/17.
//  Copyright © 2017 Dragoman Developers. All rights reserved.
//

import Foundation

class ItemManager {
    var toDoCount = 0
    var doneCount = 0
    private var toDoItems : [ToDoItem] = []
    
    func addItem(_ item : ToDoItem) {
        toDoCount += 1
        toDoItems.append(item)
    }

    func item(at index : Int) -> ToDoItem {
        return toDoItems[index]
    }

}
