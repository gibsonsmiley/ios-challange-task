//
//  TaskController.swift
//  TaskChallenge
//
//  Created by Gibson Smiley on 4/15/16.
//  Copyright © 2016 Gibson Smiley. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    static let sharedController = TaskController()
    var tasks: [Task] {
        let context = Stack.sharedStack.managedObjectContext
        let request = NSFetchRequest(entityName: "Task")
        if let tasks = (try? context.executeFetchRequest(request)) as? [Task] {
            return tasks
        }
        return []
    }
    
    func addTask(name: String, complete: Bool, due: NSDate?, notes: String?) {
        let _ = Task(name: name, complete: complete, due: due, notes: notes)
        saveToPersistentStorage()
    }
    
//    func removeTask(task: Task) {
//        let index = tasks.indexOf(task)
//        tasks.removeAtIndex(index)
//        saveToPersistentStorage()
//    }
    
    func saveToPersistentStorage() {
        let _ = try? Stack.sharedStack.managedObjectContext.save()
    }
    
    func taskCompletionChanged(task: Task, complete: Bool) {
        task.complete = complete
        saveToPersistentStorage()
    }
}