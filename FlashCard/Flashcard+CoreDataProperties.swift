//
//  Flashcard+CoreDataProperties.swift
//  FlashCard
//
//  Created by Henry Aguinaga on 2018-10-10.
//  Copyright © 2018 Henry Aguinaga. All rights reserved.
//
//

import Foundation
import CoreData


extension Flashcard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Flashcard> {
        return NSFetchRequest<Flashcard>(entityName: "Flashcard")
    }

    @NSManaged public var question: String?
    @NSManaged public var answer: String?

}
