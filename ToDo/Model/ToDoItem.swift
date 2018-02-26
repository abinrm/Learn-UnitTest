//
//  ToDoItem.swift
//  ToDo
//
//  Created by Abin Baby on 23/02/2018.
//  Copyright © 2018 Abin Baby. All rights reserved.
//

import Foundation
struct ToDoItem : Equatable {
    
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    let location: Location?
    
    init(title: String,
         itemDescription: String? = nil,
         timestamp: Double? = nil,
         location: Location? = nil) {
        
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
}

func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
    if lhs.location != rhs.location {
        return false
    }
    if lhs.timestamp != rhs.timestamp {
        return false
    }
    if lhs.itemDescription != rhs.itemDescription {
        return false
    }
    if lhs.title != rhs.title {
        return false
    }
    return true
}


