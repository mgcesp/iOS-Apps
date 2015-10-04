//
//  PlayerModel.swift
//  ProEleven
//
//  Created by Manuel Cespedes on 9/29/15.
//  Copyright © 2015 DevBros. All rights reserved.
//

import UIKit
import CoreData

class PlayerModel: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var avatar: NSData

}
