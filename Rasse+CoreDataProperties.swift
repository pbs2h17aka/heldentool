//
//  Rasse+CoreDataProperties.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 5/24/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//
//

import Foundation
import CoreData


extension Rasse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rasse> {
        return NSFetchRequest<Rasse>(entityName: "Rasse")
    }

    @NSManaged public var name: String?
    @NSManaged public var mut: Int32
    @NSManaged public var klugheit: Int32
    @NSManaged public var intuition: Int32
    @NSManaged public var charisma: Int32
    @NSManaged public var fingerfertigkeit: Int32
    @NSManaged public var gewandheit: Int32
    @NSManaged public var koerperkraft: Int32

}
