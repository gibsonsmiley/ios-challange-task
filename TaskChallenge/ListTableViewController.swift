//
//  ListTableViewController.swift
//  TaskChallenge
//
//  Created by Gibson Smiley on 4/15/16.
//  Copyright © 2016 Gibson Smiley. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController, TaskTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Methods
    
    func taskCompletion(cell: TaskTableViewCell, complete: Bool) {
        if let indexPath = tableView.indexPathForCell(cell) {
        let task = TaskController.sharedController.tasks[indexPath.row]
            TaskController.sharedController.taskCompletionChanged(task, complete: complete)
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedController.tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath) as? TaskTableViewCell {
            let task = TaskController.sharedController.tasks[indexPath.row]
            cell.updateWithTask(task)
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    /*
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     //            TaskController.sharedController.removeTask()
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     }
     } */
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seeDetail" {
            if let destinationViewController = segue.destinationViewController as? DetailTableViewController {
                _ = destinationViewController.view
                let indexPath = self.tableView.indexPathForSelectedRow
                if let selectedRow = indexPath?.row {
                    let task = TaskController.sharedController.tasks[selectedRow]
                    destinationViewController.updateWithTask(task)
                }
            }
        }
    }
}
