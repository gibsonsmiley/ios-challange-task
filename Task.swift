//
//  Task.swift
//  TaskChallenge
//
//  Created by Gibson Smiley on 4/15/16.
//  Copyright © 2016 Gibson Smiley. All rights reserved.
//

import Foundation
import CoreData


class Task: NSManagedObject {

    convenience init(name: String, complete: Bool = false, due: NSDate?, notes: String?) {
        let context = Stack.sharedStack.managedObjectContext
        let entity = NSEntityDescription.entityForName("Task", inManagedObjectContext: context)!
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.name = name
        self.complete = complete
        self.due = due
        self.notes = notes
    }
}
