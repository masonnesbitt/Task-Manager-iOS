//
//  TaskDetailsViewController.swift
//  Task Manager iOS
//
//  Created by Mason Nesbitt on 10/31/18.
//  Copyright © 2018 Mason Nesbitt. All rights reserved.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    @IBOutlet weak var taskTitleOnDescriptionScreen: UILabel!
 
    @IBOutlet weak var taskDescriptionLabelThing: UILabel!
    // Matches class and task
    var taskDescription: Task!
    var taskTitle: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // show task title and description
        taskDescriptionLabelThing.text = taskDescription.taskDescription
        taskTitleOnDescriptionScreen.text = taskTitle.taskTitle
    }
}
