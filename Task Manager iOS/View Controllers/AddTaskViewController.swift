//
//  AddTaskViewController.swift
//  Task Manager iOS
//
//  Created by Mason Nesbitt on 10/31/18.
//  Copyright © 2018 Mason Nesbitt. All rights reserved.
//

import UIKit
import RealmSwift

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskTitleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var prioritySegmentedController: UISegmentedControl!
    
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tap to remove keyboard
        
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func showError() {
        let newAlert = UIAlertController(title: "Need Text", message: "Please Enter TEXT", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Resume", style: .default, handler: nil)
        newAlert.addAction(closeAction)
        self.present(newAlert, animated: true, completion: nil)

    }
    @IBAction func submitButtonTapped(_ sender: Any) {
        
       
        guard let title = taskTitleTextField.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            else {
            showError()
            return
            
        }
        guard let description = descriptionTextField.text, description.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            showError()
            return
            
        }
        
        // properties switch
        var priority: String!
        switch prioritySegmentedController.selectedSegmentIndex {
        case 0:
            priority = "First"
        case 1:
            priority = "Second"
        case 2:
            priority = "Third"
        case 3:
            priority = "Fourth"
        case 4:
            priority = "Fifth"
        default:
            priority = "First"
        }
        // New Task Cell
        let newTask = Task()
        newTask.taskTitle = title
        newTask.taskDescription = description
        newTask.completed = false
        newTask.priority = priority
        newTask.dueDate = dueDatePicker.date
        
        TaskManager.sharedInstance.addTask(task: newTask)
    }
}







