//
//  TaskManager.swift
//  Task Manager iOS
//
//  Created by Mason Nesbitt on 10/31/18.
//  Copyright © 2018 Mason Nesbitt. All rights reserved.
//

import Foundation
import RealmSwift

class TaskManager {
    // persistance with realm
    static let sharedInstance = TaskManager()
    
    private init() {
        tasks = realm.objects(Task.self)
    }
    private var tasks: Results<Task>!
    
    let realm = try! Realm()
    // get count of our Task
    func getTaskCount() -> Int {
        return tasks.count
    }
    // get task pulled up
    func getTask(at index: Int) -> Task {
        return tasks[index]
    }
    // add a task
    func addTask(task: Task) {
        try! realm.write {
            realm.add(task)
        }
    }
    // remove a task
    func removetask(at index: Int) {
        try! realm.write {
            realm.delete(getTask(at: index))
        }
    }
    // Chect a task completed or incompleted
    func checkTaskInOrOut(at index: Int) {
        let taskForIndex = tasks[index]
        try! realm.write {
            taskForIndex.completed = !taskForIndex.completed
            if taskForIndex.completed {
                taskForIndex.dueDate = nil
            }
        }
       
        
        
        }
    }



