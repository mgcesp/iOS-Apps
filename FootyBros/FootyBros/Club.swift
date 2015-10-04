//
//  Club.swift
//  FootyBros
//
//  Created by Manuel Cespedes on 10/3/15.
//  Copyright © 2015 DevBros. All rights reserved.
//

import UIKit
import CoreData

class Club: NSManagedObject {
    
    struct Keys {
        static let ID = "id"
        static let Name = "name"
        static let EmblemData = "emblem_data"
    }
    
    @NSManaged var id: NSNumber?
    @NSManaged var name: String?
    @NSManaged var emblemData: NSData?
    @NSManaged var players: [Person]
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(dictionary: [String : AnyObject], context: NSManagedObjectContext) {
        
        // Get entity description
        let entDes = NSEntityDescription.entityForName("Club", inManagedObjectContext: context)!
        super.init(entity: entDes, insertIntoManagedObjectContext: context)
        
        // Init properties from dictionary
        id = dictionary[Keys.ID] as! Int
        name = dictionary[Keys.Name] as? String
        emblemData = dictionary[Keys.EmblemData] as? NSData
    }

}
