//
//  TableViewController.swift
//  Task Manager iOS
//
//  Created by Mason Nesbitt on 10/31/18.
//  Copyright © 2018 Mason Nesbitt. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func unwindToTaskTable(segue:UIStoryboardSegue) {
    }
    var currentTask: Task!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as?
            TaskDetailsViewController {
            destination.taskDescription = currentTask
            destination.taskTitle = currentTask
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.getTaskCount()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        currentTask = TaskManager.sharedInstance.getTask(at: indexPath.row)
        self.performSegue(withIdentifier: "showTaskDetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TaskTableViewCell
        
        cell.taskTitleLabel.text = TaskManager.sharedInstance.getTask(at: indexPath.row).taskTitle
        cell.priorityLabel.text = TaskManager.sharedInstance.getTask(at: indexPath.row).priority
        
        
        let date = TaskManager.sharedInstance.getTask(at: indexPath.row).dueDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        
        
        
        if !TaskManager.sharedInstance.getTask(at: indexPath.row).completed {
            cell.comOrIncomView.backgroundColor = UIColor.red
        } else {
            cell.comOrIncomView.backgroundColor = UIColor.green
        }

        if !TaskManager.sharedInstance.getTask(at: indexPath.row).completed {
            cell.dueDateLabel.text = dateFormatter.string(from: date!)
        } else {
             cell.dueDateLabel.text = ""
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _,_ in
       
            TaskManager.sharedInstance.removetask(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let taskForIndex = TaskManager.sharedInstance.getTask(at: indexPath.row)
        
        let title = !taskForIndex.completed ? "Check Complete" : "Check Incomplete"
        
        let checkComOrIncomAction = UITableViewRowAction(style: .normal, title: title) { _, _ in
            
            TaskManager.sharedInstance.checkTaskInOrOut(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    
        if TaskManager.sharedInstance.getTask(at: indexPath.row).completed {
            return [deleteAction]
        } else {
            return [deleteAction, checkComOrIncomAction]
        }
        
    }
    
}

