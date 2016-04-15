//
//  TaskTableViewCell.swift
//  TaskChallenge
//
//  Created by Gibson Smiley on 4/15/16.
//  Copyright © 2016 Gibson Smiley. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    var task: Task?
    weak var delegate: TaskTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func completeButtonTapped(sender: AnyObject) {
        print("Complete button has been tapped")
        if let task = self.task {
            delegate?.taskCompletion(self, complete: (task.complete.boolValue))
        }
    }
    
    func updateWithTask(task: Task) {
        self.task = task
        taskLabel.text = task.name
        if task.complete.boolValue == true {
            completeButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            completeButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
}

protocol TaskTableViewCellDelegate: class {
    func taskCompletion(cell: TaskTableViewCell, complete: Bool)
}