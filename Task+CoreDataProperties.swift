//
//  Task+CoreDataProperties.swift
//  TaskChallenge
//
//  Created by Gibson Smiley on 4/15/16.
//  Copyright © 2016 Gibson Smiley. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Task {

    @NSManaged var name: String
    @NSManaged var due: NSDate?
    @NSManaged var complete: NSNumber
    @NSManaged var notes: String?

}
