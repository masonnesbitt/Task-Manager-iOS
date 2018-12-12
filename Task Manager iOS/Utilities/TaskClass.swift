//
//  TaskClass.swift
//  Task Manager iOS
//
//  Created by Mason Nesbitt on 10/31/18.
//  Copyright © 2018 Mason Nesbitt. All rights reserved.
//

import Foundation
import RealmSwift


class Task: Object {  
    // Realm changes
    @objc dynamic var taskTitle: String = ""
    @objc dynamic var completed: Bool = true
    @objc dynamic var taskRating: String = ""
    @objc dynamic var priority: String = ""
    @objc dynamic var taskDescription: String = ""
    @objc dynamic var dueDate: Date?  = Date()
   
}
