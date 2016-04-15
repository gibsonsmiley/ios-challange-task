//
//  DetailTableViewController.swift
//  TaskChallenge
//
//  Created by Gibson Smiley on 4/15/16.
//  Copyright © 2016 Gibson Smiley. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    var task: Task?
    var dueDate: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueTextField.inputAccessoryView = dueDatePicker
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Methods
    
    func updateWithTask(task: Task) {
        self.task = task
        nameTextField.text = task.name
        if task.due != nil {
            dueTextField.text = String(task.due)
        }
        notesTextView.text = task.notes
    }
    
    func datePickerValue() {
        dueDate = dueDatePicker.date
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if task != task {
        if let name = nameTextField.text {
            let due = self.dueDate, notes = self.notesTextView.text
            TaskController.sharedController.addTask(name, complete: false, due: due, notes: notes)
            TaskController.sharedController.saveToPersistentStorage()

            self.navigationController?.popViewControllerAnimated(true)
            }
        } else {
            TaskController.sharedController.saveToPersistentStorage()
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    @IBAction func dueDatePickerValueChanged(sender: AnyObject) {
        dueTextField.text = dueDatePicker.date.description
        datePickerValue()
    }
}
